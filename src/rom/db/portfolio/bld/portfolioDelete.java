package rom.db.portfolio.bld;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;

public class portfolioDelete {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		portfolioDAO dao = new portfolioDAO();
		boolean result = false;
		beanPortfolio bean = new beanPortfolio();
		beanPortfolio bean2 = new beanPortfolio();
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print(result);
			System.out.println(result);
			return;
		}
		String uId = "dream0544";		
		int r_num = Integer.parseInt(request.getParameter("rNum")); //부모번호
		
		String saveFolder = "/common/img/portfolio";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		File f = new File(realFolder + "/" + request.getParameter("imgNm"));
		f.delete();
		
		//상세정보 조회
		List detail = new ArrayList();
		detail = (List)dao.portDetailSelect(r_num);
			
		
		bean.setU_ID(uId);
		bean.setRNUM(String.valueOf(r_num));
				
		try{
			result = dao.portfolioDelete(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}
		
		//상세 이미지 삭제
		for(int i=0; i<detail.size(); i++){
			bean2 = (beanPortfolio)detail.get(i);
			f = new File(realFolder + "/" + bean2.getIMG());
			f.delete();
		}
				
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
