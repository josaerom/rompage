package rom.db.portfolio.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class portfolioUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		portfolioDAO dao = new portfolioDAO();
		boolean result = false;
		beanPortfolio bean = new beanPortfolio();
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			System.out.println(result);
			return;
		}
		
		String uId = "dream0544";
		String thumb_memo = request.getParameter("THUMBNAIL_MEMO"); //썸네일 설명
		String order_org = request.getParameter("ORDER_ORG"); //발주처
		String sdate = request.getParameter("SDATE"); //시작일
		String edate = request.getParameter("EDATE"); //종료일
		String view_yn = request.getParameter("VIEW_YN"); //노출여부
		String content = request.getParameter("CONTENT");	//글 내용 String에 담아서 줄바꿈/스페이스바 처리
		content = content.replaceAll("\r\n", "<br>");       // 줄바꿈 처리
   		content = content.replaceAll("\u0020", "&nbsp;");  // 스페이스바 처리
   		String r_num = request.getParameter("R_NUM"); //번호
   		
   		System.out.println(content);
   		
   		bean.setU_ID(uId);
   		bean.setTHUMBNAIL_MEMO(thumb_memo);
   		bean.setORDER_ORG(order_org);
   		bean.setSDATE(sdate);
   		bean.setEDATE(edate);
   		bean.setCONTENT(content);
   		bean.setVIEW_YN(view_yn);
   		bean.setRNUM(r_num);
   		
		try{
			result = dao.portfolioUpdate(bean);	//수정 dao
			System.out.println("!!!!!!!!!!!!!!!!");
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\"}");		
	}
}
