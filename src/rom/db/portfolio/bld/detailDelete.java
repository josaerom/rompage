package rom.db.portfolio.bld;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class detailDelete {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		portfolioDAO dao = new portfolioDAO();
		boolean result = false;
		beanPortfolio bean = new beanPortfolio();
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			out.print(result);
			return;
		}
		String uId = "dream0544";		
		int p_num = Integer.parseInt(request.getParameter("pNum")); //부모번호
		String subrNum = request.getParameter("subrNum"); //번호
				
		String saveFolder = "/common/img/portfolio";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		File f = new File(realFolder + "/" + request.getParameter("imgNm"));
		f.delete();
		
		bean.setU_ID(uId);
		bean.setPNUM(p_num);
		bean.setRNUM(subrNum);
		
		try{
			result = dao.detailDelete(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
