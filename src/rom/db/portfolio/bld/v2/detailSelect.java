package rom.db.portfolio.bld.v2;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class detailSelect implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		portfolioDAO dao = new portfolioDAO();
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/rompage/v2/portfolio/portfolioList.jsp");
		
		request.setAttribute("rNum", request.getParameter("rNum"));
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		
		return forward;
	}
}
