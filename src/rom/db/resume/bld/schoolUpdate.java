package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;
import rom.db.resume.beanInfo;
import rom.db.resume.beanSchool;
import rom.db.resume.resumeDAO;

public class schoolUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		beanSchool bean = new beanSchool();
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print(result);	
			return;
		}
		
		String uId = "dream0544";
		String gubun = request.getParameter("GUBUN"); //구분
		String name = request.getParameter("NAME"); //기관명
		String major = request.getParameter("MAJOR"); //전공
		String addr = request.getParameter("ADDR"); //소재지
		String results = request.getParameter("RESULTS"); //졸업여부
		String sdate = request.getParameter("SDATE");	//입학일
		String edate = request.getParameter("EDATE"); //졸업일
		String rnum = request.getParameter("RNUM"); //번호
		
   		bean.setU_ID(uId);
   		bean.setGUBUN(gubun);
   		bean.setNAME(name);
   		bean.setMAJOR(major);
   		bean.setADDR(addr);
   		bean.setRESULTS(results);
   		bean.setSDATE(sdate);
   		bean.setEDATE(edate);
   		bean.setRNUM(rnum);
   		
		try{
			result = dao.schoolUpdate(bean);
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		PrintWriter out=response.getWriter();
		out.print(result);		
	}
}
