package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanStudy;
import rom.db.resume.resumeDAO;

public class studyUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		String uId = "dream0544";
		String tableNm = "TB_RS_STUDY";
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			return;
		}
		
		try{
			result = dao.resumDelete(uId, tableNm);
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		String[] sdate = request.getParameterValues("SDATE"); //시작일
		String[] edate = request.getParameterValues("EDATE"); //종료일
		String[] name = request.getParameterValues("NAME"); //교육명
		String[] org_name = request.getParameterValues("ORG_NAME"); //교육기관
		String[] content = request.getParameterValues("CONTENT"); //교육내용
		String[] memo = request.getParameterValues("MEMO"); //비고
   		
		for(int i=sdate.length-1; i >= 0; i--){
			beanStudy bean = new beanStudy();
			bean.setU_ID(uId);
	   		bean.setSDATE(sdate[i]);
	   		bean.setEDATE(edate[i]);
	   		bean.setNAME(name[i]);
	   		bean.setORG_NAME(org_name[i]);
	   		bean.setCONTENT(content[i]);
	   		bean.setMEMO(memo[i]);
	   		
	   		try{
				result = dao.studyUpdate(bean);
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
