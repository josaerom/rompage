package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanWork;
import rom.db.resume.resumeDAO;

public class workUpdate {
	
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
		String tableNm = "TB_RS_WORK";
		
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
		String[] work_mon = request.getParameterValues("WORK_MON"); //개월
		String[] work_name = request.getParameterValues("WORK_NAME"); //근무처명
		String[] work_team = request.getParameterValues("WORK_TEAM"); //소속팀
		String[] part = request.getParameterValues("PART");	//담당업무
   		
		for(int i=sdate.length-1; i >= 0; i--){
			beanWork bean = new beanWork();
			System.out.println(sdate[i]);
			bean.setU_ID(uId);
	   		bean.setSDATE(sdate[i]);
	   		bean.setEDATE(edate[i]);
	   		bean.setWORK_MON(work_mon[i]);
	   		bean.setWORK_NAME(work_name[i]);
	   		bean.setWORK_TEAM(work_team[i]);
	   		bean.setPART(part[i]);
	   		
	   		try{
				result = dao.workUpdate(bean);
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
