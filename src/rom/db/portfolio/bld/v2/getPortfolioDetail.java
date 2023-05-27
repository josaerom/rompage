package rom.db.portfolio.bld.v2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class getPortfolioDetail{
	public Map<String, Object> getPortfolioList(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		System.out.println("[portfolioSelectV2] getPortfolioList");
		portfolioDAO dao = new portfolioDAO();
		
		String uId = "dream0544";
		System.out.println(request.getParameter("rNum"));
		System.out.println(request.getParameter("currentPage"));
		int rNum = Integer.parseInt(request.getParameter("rNum").toString());
		
		//포트폴리오 메인정보
		beanPortfolio info = new beanPortfolio();
		info = dao.portInfoSelect(uId, rNum);
		
		//포트폴리오 상세정보
		List detail = new ArrayList();
		detail = (List)dao.portDetailSelect(rNum);
		
		//포트폴리오 이전페이지,다음페이지정보
		beanPortfolio prev = new beanPortfolio();
		prev = dao.portPrev(rNum);
		//포트폴리오 이전페이지,다음페이지정보
		beanPortfolio next = new beanPortfolio();
		next = dao.portNext(rNum);
		
		
		Map<String, Object> all = new HashMap<>();
		all.put("info", info);
		all.put("detail", detail);
		all.put("prev", prev);
		all.put("next", next);
		
		return all;
	}
}
