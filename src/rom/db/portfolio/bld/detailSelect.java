package rom.db.portfolio.bld;

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
		String uId = "dream0544";
		int rNum = Integer.parseInt(request.getParameter("rNum").toString());
		
		//포트폴리오 메인정보
		beanPortfolio info = new beanPortfolio();
		info = dao.portInfoSelect(uId, rNum);
		
		//포트폴리오 상세정보
		List detail = new ArrayList();
		detail = (List)dao.portDetailSelect(rNum);
		
		request.setAttribute("info", info);//포트폴리오 메인
		request.setAttribute("detail", detail);//포트폴리오 메인
		
		forward.setRedirect(false);
		if(request.getRequestURI().matches("/admin/portfolioUpdate.cmd")){
			forward.setPath("/rompage/admin/portfolioUpdate.jsp");
		}else{
			forward.setPath("/rompage/portfolio/detail.jsp");
		}
		
		return forward;
	}
}
