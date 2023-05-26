package rom.db.portfolio.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class portfolioInsert {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		portfolioDAO dao = new portfolioDAO();
		boolean result = false;
		int rNum = 0;
		beanPortfolio bean = new beanPortfolio();
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\" , \"pNum\" : \""+rNum+"\"}");
			System.out.println(result);
			return;
		}
		
		String uId = "dream0544";
		String saveFolder = "/common/img/portfolio";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		int fileSize=5*1024*1024;	//파일 사이즈
		
		MultipartRequest multi=null;	//외부자르 cos Open Declaration com.oreilly.servlet.MultipartRequest
		multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());	//MultipartRequest생성
		
		String thumb_img = multi.getParameter("THUMBNAIL_IMG"); //썸네일 이미지
		String thumb_memo = multi.getParameter("THUMBNAIL_MEMO"); //썸네일 설명
		String order_org = multi.getParameter("ORDER_ORG"); //발주처
		String sdate = multi.getParameter("SDATE"); //시작일
		String edate = multi.getParameter("EDATE"); //종료일
		String view_yn = multi.getParameter("VIEW_YN"); //노출여부
		String content = multi.getParameter("CONTENT");	//글 내용 String에 담아서 줄바꿈/스페이스바 처리
		content = content.replaceAll("\r\n", "<br>");       // 줄바꿈 처리
   		content = content.replaceAll("\u0020", "&nbsp;");  // 스페이스바 처리
   		
   		bean.setU_ID(uId);
   		bean.setTHUMBNAIL_IMG(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
   		bean.setTHUMBNAIL_MEMO(thumb_memo);
   		bean.setORDER_ORG(order_org);
   		bean.setSDATE(sdate);
   		bean.setEDATE(edate);
   		bean.setCONTENT(content);
   		bean.setVIEW_YN(view_yn);
   		
		try{
			rNum = dao.portfolioInsert(bean);	//등록 dao
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\" , \"pNum\" : \""+rNum+"\"}");		
	}
}
