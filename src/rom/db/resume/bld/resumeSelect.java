package rom.db.resume.bld;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.resume.beanInfo;
import rom.db.resume.resumeDAO;

public class resumeSelect implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		resumeDAO dao = new resumeDAO();
		ActionForward forward = new ActionForward();
		String uId = "dream0544";
		
		//기본정보, 개인신상정보
		beanInfo info = new beanInfo();
		info = dao.infoSelect(uId);
		//이력
		List work = new ArrayList();
		work = (List) dao.selectWork(uId);
		//프로젝트 수행
		List project = new ArrayList();
		project = (List) dao.selectProject(uId);
		//자격/면허
		List license = new ArrayList();
		license = (List) dao.selectLicense(uId);
		//보유기술 및 능력
		List skill = new ArrayList();
		skill = (List) dao.selectSkill(uId);
		//교육이수내역
		List study = new ArrayList();
		study = (List) dao.selectStudy(uId);
		//학력
		List school = new ArrayList();
		school = (List) dao.selectSchool(uId);
		//가족관계
		List family = new ArrayList();
		family = (List) dao.selectFamily(uId);
		
		request.setAttribute("info", info);//기본정보, 개인신상정보
		request.setAttribute("work", work);//이력
		request.setAttribute("project", project);//프로젝트 수행
		request.setAttribute("license", license);//자격/면허
		request.setAttribute("skill", skill);//보유기술 및 능력
		request.setAttribute("study", study);//교육이수내역
		request.setAttribute("school", school);//학력
		request.setAttribute("family", family);//가족관계
		
		forward.setRedirect(false);
		if(request.getRequestURI().matches("/admin/resumeUpdate.cmd")){
			forward.setPath("/rompage/admin/resumeUpdate.jsp");
		}else{
			forward.setPath("/rompage/resume/resume.jsp");
		}
		
		return forward;
	}
}
