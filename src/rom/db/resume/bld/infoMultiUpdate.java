package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rom.action.ActionForward;
import rom.db.portfolio.beanPortfolio;
import rom.db.portfolio.portfolioDAO;
import rom.db.resume.beanInfo;
import rom.db.resume.resumeDAO;

public class infoMultiUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		boolean result = false;
		beanInfo bean = new beanInfo();
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print("{\"result\" : \""+result+"\"}");
			return;
		}
		
		String saveFolder = "/common/img/resume";	//저장폴더
		String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		int fileSize=5*1024*1024;	//파일 사이즈
		
		MultipartRequest multi=null;	//외부자르 cos Open Declaration com.oreilly.servlet.MultipartRequest
		multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());	//MultipartRequest생성
		
		String uId = "dream0544";
		String kor_name = multi.getParameter("KOR_NAME"); //이름
		String eng_name1 = multi.getParameter("ENG_NAME1"); //영문이름 성
		String eng_name2 = multi.getParameter("ENG_NAME2"); //영문이름 이름
		String chin_name = multi.getParameter("CHIN_NAME"); //한문이름
		String ssn = multi.getParameter("SSN"); //주민등록번호
		String addr = multi.getParameter("ADDR");	//주소
		String tel1 = multi.getParameter("TEL1"); //전화번호1
		String tel2 = multi.getParameter("TEL2"); //전화번호2
		String tel3 = multi.getParameter("TEL3"); //전화번호3
		String email = multi.getParameter("EMAIL"); //이메일
   		
   		bean.setU_ID(uId);
   		bean.setPHOTO(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
   		bean.setKOR_NAME(kor_name);
   		bean.setENG_NAME1(eng_name1);
   		bean.setENG_NAME2(eng_name2);
   		bean.setCHIN_NAME(chin_name);
   		bean.setSSN(ssn);
   		bean.setADDR(addr);
   		bean.setTEL1(tel1);
   		bean.setTEL2(tel2);
   		bean.setTEL3(tel3);
   		bean.setEMAIL(email);
   		System.out.println("multi");
		try{
			result = dao.infoUpdate(bean);
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
