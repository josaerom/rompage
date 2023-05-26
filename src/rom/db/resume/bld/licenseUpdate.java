package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanLicense;
import rom.db.resume.resumeDAO;

public class licenseUpdate {
	
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
		String tableNm = "TB_RS_LICENSE";
		
		try{
			result = dao.resumDelete(uId, tableNm);
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		String[] name = request.getParameterValues("NAME"); //자격/면허 명
		String[] issu_org = request.getParameterValues("ISSU_ORG"); //발급기관명
		String[] get_date = request.getParameterValues("GET_DATE"); //취득일
		String[] results = request.getParameterValues("RESULTS"); //합격구분
   		
		for(int i=name.length-1; i >= 0; i--){
			beanLicense bean = new beanLicense();
			bean.setU_ID(uId);
	   		bean.setNAME(name[i]);
	   		bean.setISSU_ORG(issu_org[i]);
	   		bean.setGET_DATE(get_date[i]);
	   		bean.setRESULTS(results[i]);
	   		
	   		try{
				result = dao.licenseUpdate(bean);
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
