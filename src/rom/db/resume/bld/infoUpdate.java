package rom.db.resume.bld;

import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanInfo;
import rom.db.resume.resumeDAO;

public class infoUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		beanInfo bean = new beanInfo();
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			return;
		}
		
		String uId = "dream0544";
		String kor_name =  request.getParameter("KOR_NAME"); //이름
		String eng_name1 = request.getParameter("ENG_NAME1"); //영문이름 성
		String eng_name2 = request.getParameter("ENG_NAME2"); //영문이름 이름
		String chin_name =  request.getParameter("CHIN_NAME") ; //한문이름
		String ssn = request.getParameter("SSN"); //주민등록번호
		String addr = request.getParameter("ADDR");	//주소
		String tel1 = request.getParameter("TEL1"); //전화번호1
		String tel2 = request.getParameter("TEL2"); //전화번호2
		String tel3 = request.getParameter("TEL3"); //전화번호3
		String email = request.getParameter("EMAIL"); //이메일
   		
   		bean.setU_ID(uId);
   		bean.setKOR_NAME(kor_name);
   		bean.setENG_NAME1(eng_name1);
   		bean.setENG_NAME2(eng_name2);
   		bean.setCHIN_NAME(chin_name);
   		bean.setSSN(ssn);
   		bean.setADDR(addr);
   		bean.setTEL1(tel1);
   		bean.setTEL2(tel2);
   		bean.setTEL3(tel3);
   		bean.setEMAIL(email);
   		
		try{
			result = dao.infoUpdate(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\"}");		
	}
}
