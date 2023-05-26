package rom.db.resume.bld;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanSchool;
import rom.db.resume.resumeDAO;

public class schoolDelete {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		beanSchool bean = new beanSchool();
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print(result);
			return;
		}
		
		String uId = "dream0544";		
		String rNum = request.getParameter("RNUM"); //번호
				
		String saveFolder = "/common/img/resume";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		File f = new File(realFolder + "/" + request.getParameter("PHOTO_URL"));
		f.delete();
		
		bean.setU_ID(uId);
		bean.setRNUM(rNum);
		
		try{
			result = dao.schoolDelete(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
