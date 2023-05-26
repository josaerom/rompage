package rom.db.resume.bld;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.resume.beanSelfIntro;
import rom.db.resume.resumeDAO;

public class selfIntroSelect implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		ActionForward forward = new ActionForward();
		String uId = "dream0544";
		
		//기본정보, 개인신상정보
		beanSelfIntro intro = new beanSelfIntro();
		intro = dao.selfIntroSelect(uId);
				
		request.setAttribute("intro", intro);
		
		forward.setRedirect(false);
		if(request.getRequestURI().matches("/admin/selfIntroUpdate.cmd")){
			forward.setPath("/rompage/admin/selfIntroUpdate.jsp");
		}else{
			forward.setPath("/rompage/resume/selfIntroduction.jsp");
		}
		
		return forward;
	}
}
