package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanProject;
import rom.db.resume.resumeDAO;

public class projectUpdate {
	
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
		String tableNm = "TB_RS_PROJECT";
		
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
		String[] position = request.getParameterValues("POSITION"); //직책
		String[] order_org = request.getParameterValues("ORDER_ORG"); //발추처
		String[] duty = request.getParameterValues("DUTY"); //수행업무
		String[] work_name = request.getParameterValues("WORK_NAME");	//소속
   		
		for(int i=sdate.length-1; i >= 0; i--){
			beanProject bean = new beanProject();
			System.out.println(sdate[i]);
			bean.setU_ID(uId);
	   		bean.setSDATE(sdate[i]);
	   		bean.setEDATE(edate[i]);
	   		bean.setPOSITION(position[i]);
	   		bean.setORDER_ORG(order_org[i]);
	   		bean.setDUTY(duty[i]);
	   		bean.setWORK_NAME(work_name[i]);
	   		
	   		try{
				result = dao.projectUpdate(bean);
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
