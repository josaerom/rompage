package rom.db.resume.bld;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.resume.beanSchool;
import rom.db.resume.resumeDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class schoolMultiUpdate {
	
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
		String saveFolder = "/common/img/resume";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		int fileSize=5*1024*1024;	//파일 사이즈
		
		MultipartRequest multi=null;	//외부자르 cos Open Declaration com.oreilly.servlet.MultipartRequest
		multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());	//MultipartRequest생성
		
		File f = new File(realFolder + "/" + multi.getParameter("PHOTO_URL"));
		f.delete();
		System.out.println("testtest tets  >>>>>>> "+multi.getParameter("PHOTO_URL"));
		
		String gubun = multi.getParameter("GUBUN"); //구분
		String name = multi.getParameter("NAME"); //기관명
		String major = multi.getParameter("MAJOR"); //전공
		String addr = multi.getParameter("ADDR"); //소재지
		String results = multi.getParameter("RESULTS"); //졸업여부
		String sdate = multi.getParameter("SDATE");	//입학일
		String edate = multi.getParameter("EDATE"); //졸업일
		String rnum = multi.getParameter("RNUM"); //번호
		
		bean.setU_ID(uId);
   		bean.setGUBUN(gubun);
   		bean.setNAME(name);
   		bean.setMAJOR(major);
   		bean.setADDR(addr);
   		bean.setRESULTS(results);
   		bean.setSDATE(sdate);
   		bean.setEDATE(edate);
   		bean.setRNUM(rnum);
   		bean.setPHOTO(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		
		try{
			result = dao.schoolUpdate(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
