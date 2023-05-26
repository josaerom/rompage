package rom.db.resume.bld;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.resume.beanSelfIntro;
import rom.db.resume.resumeDAO;

public class selfIntroUpdate {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		ActionForward forward = new ActionForward();
		String uId = "dream0544";
		boolean result =  false;
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("user") == null){
			System.out.println(session.getAttribute("user"));
			PrintWriter out=response.getWriter();
			out.print(result);
			return;
		}
		
		String title = request.getParameter("TITLE");
		String intro = request.getParameter("INTRO");
		intro = intro.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		String grow = request.getParameter("GROW");
		grow = grow.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		String character_yn = request.getParameter("CHARACTER_YN");
		character_yn = character_yn.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		String appl_reason = request.getParameter("APPL_REASON");
		appl_reason = appl_reason.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		String hope = request.getParameter("HOPE");
		hope = hope.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		String special = request.getParameter("SPECIAL");
		special = special.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");// 줄바꿈 처리, 스페이스바 처리
		
		beanSelfIntro bean = new beanSelfIntro();
		bean.setU_ID(uId);
		bean.setTITLE(title);
		bean.setINTRO(intro);
		bean.setGROW(grow);
		bean.setCHARACTER_YN(character_yn);
		bean.setAPPL_REASON(appl_reason);
		bean.setHOPE(hope);
		bean.setSPECIAL(special);
		
		//기본정보, 개인신상정보
		try{
			result = dao.selfIntroInsert(bean);
		}catch(Exception e){
			System.out.println("예외발생" + e);
			e.printStackTrace();
			response.sendRedirect("/board/error/error500.jsp");
		}		
		PrintWriter out=response.getWriter();
		out.print(result);
	}
}
