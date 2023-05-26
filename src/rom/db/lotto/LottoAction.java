package rom.db.lotto;

import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.sql.DataSource;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;
/**
 * 
 * @author ci
 * 설명 : 게시판 리스트
 * 
 * 최초 작성자 : 조새롬
 * 최초 작성날짜 : 2013-10-21
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 조새롬
 * 최종 수정날짜 : 2013-10-24
 * 수정 목적 :  DAO생성자 팩토리패턴으로 변경
 *
 */
public class LottoAction{	
	//로또번호생성
	public void create(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-------------------create");
		int x = 0;;
		int arr[] = new int[6];
		int temp = 0;;
		List lottoNum = new ArrayList();
		int parmIdx = 0;
		for(int i=0; i<6; i++){
			System.out.println("-------------------create input >> " + request.getParameter("num"+i));			
			if(!request.getParameter("num"+i).equals("")){
				arr[i] = Integer.parseInt(request.getParameter("num"+i));
				parmIdx++;
			}else{
				x = (int)(Math.random()*45+1); //랜덤함수 호출(범위 1-45)
				arr[i] = x;
				for(int j=0; j<i; j++){
					if(arr[i] == arr[j]){
						System.out.println(arr[i]);
						System.out.println(arr[j]);
						x = (int)(Math.random()*45+1);
						arr[i] = x;
						System.out.println(arr[i]);
						i = i-1;
						break;
					}
				}
			}			
		}
		System.out.println("parmIdx >> "+parmIdx);
		for(int k=0; k<6; k++){
			for(int idx=parmIdx; idx<=k; idx++){
				if(arr[k]<=arr[idx]){
					temp = arr[k];
					arr[k] = arr[idx];
					arr[idx] = temp;
				}
			}			
		}
		for(int result=0; result<6; result++){			
			lottoNum.add(result, arr[result]);
		}
		System.out.println("---------------------create output >> " + arr[0]+", " + arr[1]+", "+ arr[2]+", "+ arr[3]+", "+ arr[4]+", "+ arr[5]+", ");
		System.out.println("---------------------create output >> "+ lottoNum);
		request.setAttribute("lottoNum", lottoNum);
		String numJson = paresJson(lottoNum);
		response.getWriter().print(numJson);
		/*PrintWriter out=response.getWriter();
		out.print(result);*/
	}
	public String paresJson(List lottoNum){
		String jsonText = "";
		jsonText += "{\"lotto\":[";
		for(int i=0;i<lottoNum.size(); i++){
			if(i==0){
				jsonText += "{\"num\"";
			}else{
				jsonText += ",{\"num\"";
			}
			jsonText += ":\""+ lottoNum.get(i) + "\"}";		
		}
		jsonText += "]}";
		System.out.println("---------------------json >> "+jsonText);
		return jsonText;
	}
	
	//나눔로또 결과
	public void result(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//나눔로또 홈페이지 당첨번호가져오기
        String url = "http://nlotto.co.kr/lotto645Confirm.do?method=byWin";
         
        //해당 URL 페이지를 가져온다.
        Source source = new Source(new URL(url));
         
        //해당 데이터가 있는 부분을 찾는 부분.        
        Element div = source.getAllElements().get(2).getAllElements(HTMLElementName.META).get(4);
        System.out.println("--------------------->> "+div);
        String content = div.getAttributeValue("content");
        System.out.println("--------------------->> "+content.subSequence(content.indexOf("또")+1, content.indexOf("회")));
        String cnt = (String)content.subSequence(content.indexOf("또")+1, content.indexOf("회"));
        String num = (String)content.subSequence(content.indexOf("호")+1, content.indexOf("."));
        String rank = (String)content.subSequence(content.indexOf("총")+1, content.indexOf("명"));
        String money = (String)content.subSequence(content.indexOf("액")+1, content.indexOf("원"));
        
        String[] numArr = num.split(",");
        
        System.out.println("--------------------->> 5 "+numArr[5].substring(0, numArr[5].indexOf("+")));
        System.out.println("--------------------->> 6 "+numArr[5].substring(numArr[5].indexOf("+")+1, numArr[5].length()));
        System.out.println("--------------------->> "+cnt);
        System.out.println("--------------------->> "+num);
        System.out.println("--------------------->> "+rank);
        System.out.println("--------------------->> "+money);
        String jsonResult = "";
        jsonResult += "{\"lottoNum\":[{";
        jsonResult += "\"cnt\":";
        jsonResult += "\""+cnt+ "\",";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[0]+ "\",";        
        jsonResult += "\"rank\":";
        jsonResult += "\""+rank+ "\",";
        jsonResult += "\"money\":";
        jsonResult += "\""+money+"\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[1]+ "\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[2]+ "\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[3]+ "\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[4]+ "\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[5].substring(0, numArr[5].indexOf("+"))+ "\"";
        jsonResult += "},{";
        jsonResult += "\"num\":";
        jsonResult += "\""+numArr[5].substring(numArr[5].indexOf("+")+1, numArr[5].length())+ "\"";
        jsonResult += "}]}";
        System.out.println("---------------------jsonResult >>  "+jsonResult);
        response.getWriter().write(jsonResult);
	}
	//로또번호 리스트가져오기
	public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("list");
		List list = new ArrayList();
		HttpSession session = request.getSession();
		Map user = (Map)session.getAttribute("user");
		
		if(user == null){
			Map map = new HashMap();
			map.put("\"result\"", "\"false\"");
			list.add(map);
			PrintWriter out = response.getWriter();
			out.print(list);
			return;
		}
		String uId = user.get("U_ID").toString();
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();	
		PreparedStatement pstm = null;
		pstm = conn.prepareStatement("SELECT * FROM TB_LOTTO_LIST WHERE U_ID = ? ORDER BY CREATEDATE DESC;");
		pstm.setString(1, uId);
		ResultSet rset = pstm.executeQuery();
				
		while (rset.next()) {
			Map map = new HashMap();
			map.put("\"fav\"", "\""+ rset.getString("FAVORITE")+"\"");
			map.put("\"idx\"", "\""+ rset.getString("NUM")+"\"");
			map.put("\"num0\"", "\""+ rset.getString("LOTTONUM0")+"\"");
			map.put("\"num1\"", "\""+rset.getString("LOTTONUM1")+"\"");
			map.put("\"num2\"", "\""+rset.getString("LOTTONUM2")+"\"");
			map.put("\"num3\"", "\""+rset.getString("LOTTONUM3")+"\"");
			map.put("\"num4\"", "\""+rset.getString("LOTTONUM4")+"\"");
			map.put("\"num5\"", "\""+rset.getString("LOTTONUM5")+"\"");
			map.put("\"createDate\"", "\""+rset.getString("CREATEDATE")+"\"");
			map.put("\"result\"", "\"true\"");
			list.add(map);
			System.out.println("mysql version=="+rset.getString("LOTTONUM1")); 
		}
		rset.close();
		pstm.close();
		stmt.close();		
		conn.close();
		initCtx.close();		
		
		PrintWriter out = response.getWriter();
		out.print(list);
	}
	//로또번호 저장
	public void insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("insert");
		boolean result =  false;
		HttpSession session = request.getSession();
		Map user = (Map)session.getAttribute("user");
		String uId = user.get("U_ID").toString();
		System.out.println(uId);
		
		String num0 = request.getParameter("num0");
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String num3 = request.getParameter("num3");
		String num4 = request.getParameter("num4");
		String num5 = request.getParameter("num5");
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		PreparedStatement pstm = null;
		pstm = conn.prepareStatement("INSERT INTO TB_LOTTO_LIST"+
				"(LOTTONUM0,LOTTONUM1,LOTTONUM2,LOTTONUM3,LOTTONUM4,LOTTONUM5,U_ID,CREATEDATE)" 
				+"VALUES(?,?,?,?,?,?,?,SYSDATE());");
		pstm.setString(1, num0);
		pstm.setString(2, num1);
		pstm.setString(3, num2);
		pstm.setString(4, num3);
		pstm.setString(5, num4);
		pstm.setString(6, num5);
		pstm.setString(7, uId);
		int rslt = pstm.executeUpdate();
		
		if(rslt == 1){
			result = true;
		}
		pstm.close();
		stmt.close();		
		conn.close();
		initCtx.close();
		PrintWriter out = response.getWriter();		
		out.print(result);
	}
	//로또번호 삭제
	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("delete");
		
		String listIdx = request.getParameter("listIdx");
		System.out.println(listIdx);
		HttpSession session = request.getSession();
		Map user = (Map)session.getAttribute("user");
		String uId = user.get("U_ID").toString();
		
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		PreparedStatement pstm = null;
		pstm = conn.prepareStatement("DELETE FROM TB_LOTTO_LIST WHERE NUM = ? AND U_ID = ?;");
		pstm.setString(1, listIdx);
		pstm.setString(2, uId);
		pstm.executeUpdate();
		
		pstm.close();
		stmt.close();		
		conn.close();
		initCtx.close();
		System.out.println("success");
	}
	//로또번호 업데이트
	public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("update");
		
		String fav = request.getParameter("fav");
		String listIdx = request.getParameter("listIdx");
		HttpSession session = request.getSession();
		Map user = (Map)session.getAttribute("user");
		String uId = user.get("U_ID").toString();
		
		System.out.println(fav);
		System.out.println(listIdx);
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		PreparedStatement pstm = null;
		pstm = conn.prepareStatement("UPDATE TB_LOTTO_LIST SET FAVORITE = ? WHERE NUM = ? AND U_ID = ?;");
		pstm.setString(1, fav);
		pstm.setString(2, listIdx);
		pstm.setString(3, uId);
		pstm.executeUpdate();
		
		pstm.close();
		stmt.close();		
		conn.close();
		initCtx.close();
		System.out.println("success");
	}
	//사용자 저장
	public void setUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("user");
		String user = request.getParameter("user");
		HttpSession session = request.getSession();
		session.setAttribute("user", user);		
	}
}
