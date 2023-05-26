package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanSkill;
import rom.db.resume.resumeDAO;

public class skillUpdate {
	
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
		String tableNm = "TB_RS_SKILL";
		
		try{
			result = dao.resumDelete(uId, tableNm);
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		String[] skill_name = request.getParameterValues("SKILL_NAME"); //보유능력
		String[] level = request.getParameterValues("LEVEL"); //수준
		String[] memo = request.getParameterValues("MEMO"); //상세내용
   		
		for(int i=skill_name.length-1; i >= 0; i--){
			beanSkill bean = new beanSkill();
			bean.setU_ID(uId);
	   		bean.setSKILL_NAME(skill_name[i]);
	   		bean.setLEVEL(level[i]);
	   		bean.setMEMO(memo[i]);
	   		
	   		try{
				result = dao.skillUpdate(bean);
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
