package rom.db.portfolio.bld.v2;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class portfolioSelect implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		System.out.println("[portfolioSelectV2] portfolio");
		ActionForward forward = new ActionForward();
		String path = "/rompage/v2/portfolio/portfolioList.jsp";
		
		forward.setRedirect(false);
		forward.setPath(path);
		
		return forward;
	}
}
