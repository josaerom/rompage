package rom.db.portfolio.bld;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class portfolioViewUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		portfolioDAO dao = new portfolioDAO();
		boolean result = false;
		beanPortfolio bean = new beanPortfolio();
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print(result);
			System.out.println(result);
			return;
		}
		
		String uId = "dream0544";
		String view_yn = request.getParameter("VIEW_YN"); //MEMO파라미터 NAME
		String rNum = request.getParameter("rNum"); //부모번호
		
		bean.setU_ID(uId);
		bean.setRNUM(rNum);
		bean.setVIEW_YN(view_yn);
		
		try{
			result = dao.portfolioViewUpdate(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
