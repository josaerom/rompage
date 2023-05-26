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

public class detailUpdate {
	
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
		String memo_num = request.getParameter("memoNum"); //MEMO파라미터 NAME
		String memo = request.getParameter(memo_num); //설명
		memo = memo.replaceAll("\r\n", "<br>");       // 줄바꿈 처리
		memo = memo.replaceAll("\u0020", "&nbsp;");  // 스페이스바 처리
		int p_num = Integer.parseInt(request.getParameter("pNum")); //부모번호
		String subrNum = request.getParameter("subrNum"); //번호
		
		bean.setU_ID(uId);
		bean.setMEMO(memo);
		bean.setPNUM(p_num);
		bean.setRNUM(subrNum);
		
		try{
			result = dao.detailUpdate(bean);	//등록 dao
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
