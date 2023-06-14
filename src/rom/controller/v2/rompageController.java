package rom.controller.v2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.bld.v2.getPortfolioDetail;
import rom.db.portfolio.bld.v2.getPortfolioList;
import rom.db.portfolio.bld.v2.portfolioSelect;
import rom.db.portfolio.bld.v2.resumeSelect;


public class rompageController extends HttpServlet implements Servlet{
	String portfolio = "/portfolio";
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals(portfolio) || command.equals("/career") || command.contains(portfolio+"/detail")){ //포트폴리오 페이지 로드
			System.out.println("[rompageControllerV2] portfolio");
			action = new portfolioSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(portfolio+"/getPortfolioList.ajax")){ //포트폴리오 리스트 조회
			System.out.println("[rompageControllerV2] getPortfolioList.ajax getParameter >> " + request.getParameter("sort"));
			System.out.println("[rompageControllerV2] getPortfolioList.ajax getHeader >> " + request.getHeader("Accept"));
			
			
			try {
				ArrayList<beanPortfolio> list = (ArrayList<beanPortfolio>) new getPortfolioList().getPortfolioList(request, response);
				String json = new Gson().toJson(list);
				System.out.println(json);
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(json);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}			
		} /*
			 * else if(command.contains(portfolio+"/detail")){ //포트폴리오 페이지 로드
			 * System.out.println("[rompageControllerV2] detail");
			 * System.out.println("[rompageControllerV2] detail rNum >> " +
			 * request.getParameter("rNum"));
			 * System.out.println("[rompageControllerV2] detail currentPage >> " +
			 * request.getHeader("currentPage")); action = new detailSelect(); try { forward
			 * = action.execute(request, response); } catch (Exception e) {
			 * e.printStackTrace(); } }
			 */else if(command.equals(portfolio+"/getPortfolioDetail.ajax")){ //포트폴리오 페이지 로드
			System.out.println("[rompageControllerV2] getPortfolioDetail.ajax");
			try {
				Map<String, Object> list = new getPortfolioDetail().getPortfolioList(request, response);
				String json = new Gson().toJson(list);
				System.out.println(json);
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(json);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}			
		}else if(command.equals("/resume")){ //이력서 페이지 로드
			System.out.println("[rompageControllerV2] portfolio");
			action = new resumeSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward!=null){
			if(forward.isRedirect()){	 
				response.sendRedirect(forward.getPath());
			}else{	
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
