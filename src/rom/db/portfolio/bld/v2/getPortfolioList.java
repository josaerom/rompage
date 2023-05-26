package rom.db.portfolio.bld.v2;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import rom.db.portfolio.portfolioDAO;

public class getPortfolioList{
	public List getPortfolioList(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		System.out.println("[portfolioSelectV2] getPortfolioList");
		portfolioDAO dao = new portfolioDAO();
		String uId = "dream0544";
		String viewYn = " and VIEW_YN = 'Y' ";
		String Sort = request.getParameter("sort");
		System.out.println("Sort >> " + Sort);
		List main = new ArrayList();
		main = (List)dao.portMainSelect(uId, viewYn, Sort);
		
		return main;
	}
}
