package rom.db.portfolio.bld;

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
		portfolioDAO dao = new portfolioDAO();
		ActionForward forward = new ActionForward();
		String uId = "dream0544";
		String viewYn = " and VIEW_YN = 'Y' ";
		String path = "/rompage/portfolio/portfolio.jsp";
		
		if(request.getRequestURI().matches("/admin/portfolioSelect.cmd")){
			viewYn = " ";
			path = "/rompage/admin/portfolioSelect.jsp";
		}
		
		//포트폴리오 메인
		List main = new ArrayList();
		main = (List)dao.portMainSelect(uId, viewYn, "DESC");
		
		request.setAttribute("main", main);//포트폴리오 메인

		forward.setRedirect(false);
		forward.setPath(path);
		
		return forward;
	}
}
