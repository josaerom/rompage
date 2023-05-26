package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanFamily;
import rom.db.resume.resumeDAO;

public class familyUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			return;
		}
		
		String uId = "dream0544";
		String tableNm = "TB_RS_FAMILY";
		
		try{
			result = dao.resumDelete(uId, tableNm);
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		String[] rel = request.getParameterValues("REL"); //관계
		String[] name = request.getParameterValues("NAME"); //성명
		String[] birth = request.getParameterValues("BIRTH"); //주민등록번호 앞자리
		String[] live_yn = request.getParameterValues("LIVE_YN"); //동거여부
		String[] school = request.getParameterValues("SCHOOL"); //학교
		String[] job = request.getParameterValues("JOB"); //직업
   		
		for(int i=rel.length-1; i >= 0; i--){
			beanFamily bean = new beanFamily();
			bean.setU_ID(uId);
	   		bean.setREL(rel[i]);
	   		bean.setNAME(name[i]);
	   		bean.setBIRTH(birth[i]);
	   		bean.setLIVE_YN(live_yn[i]);
	   		bean.setSCHOOL(school[i]);
	   		bean.setJOB(job[i]);
	   		
	   		try{
				result = dao.familyUpdate(bean);
				System.out.println("!!!!!!!!!!!!!!!!");
			}catch(Exception e){
				System.out.println("예외발생" + e);
				e.printStackTrace();
				response.sendRedirect("/board/error/error500.jsp");
			}
		}
		
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\"}");		
	}
}
