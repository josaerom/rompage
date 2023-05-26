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

public class detailMultiUpdate {
	
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
		String saveFolder = "/common/img/portfolio";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		int fileSize=5*1024*1024;	//파일 사이즈
		
		MultipartRequest multi=null;	//외부자르 cos Open Declaration com.oreilly.servlet.MultipartRequest
		multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());	//MultipartRequest생성
		
		String memo_num = multi.getParameter("memoNum"); //MEMO파라미터 NAME
		String memo = multi.getParameter(memo_num); //설명
		memo = memo.replaceAll("\r\n", "<br>");       // 줄바꿈 처리
		memo = memo.replaceAll("\u0020", "&nbsp;");  // 스페이스바 처리
		int p_num = Integer.parseInt(multi.getParameter("pNum")); //부모번호
		String r_num = multi.getParameter("subrNum"); //자신번호
		
		bean.setU_ID(uId);
		bean.setMEMO(memo);
		bean.setIMG(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		bean.setPNUM(p_num);
		bean.setRNUM(r_num);
		
		try{
			result = dao.detailUpdate(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
