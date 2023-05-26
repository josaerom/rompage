package rom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rom.action.Action;
import rom.action.ActionForward;
import rom.db.login.logout;
import rom.db.login.bld.loginSelect;
import rom.db.lotto.LottoAction;
import rom.db.portfolio.bld.detailDelete;
import rom.db.portfolio.bld.detailInsert;
import rom.db.portfolio.bld.detailMultiUpdate;
import rom.db.portfolio.bld.detailSelect;
import rom.db.portfolio.bld.detailUpdate;
import rom.db.portfolio.bld.portfolioDelete;
import rom.db.portfolio.bld.portfolioInsert;
import rom.db.portfolio.bld.portfolioMultiUpdate;
import rom.db.portfolio.bld.portfolioSelect;
import rom.db.portfolio.bld.portfolioUpdate;
import rom.db.portfolio.bld.portfolioViewUpdate;
import rom.db.resume.bld.familyUpdate;
import rom.db.resume.bld.infoMultiUpdate;
import rom.db.resume.bld.infoUpdate;
import rom.db.resume.bld.licenseUpdate;
import rom.db.resume.bld.projectUpdate;
import rom.db.resume.bld.resumeSelect;
import rom.db.resume.bld.schoolDelete;
import rom.db.resume.bld.schoolInsert;
import rom.db.resume.bld.schoolMultiUpdate;
import rom.db.resume.bld.schoolUpdate;
import rom.db.resume.bld.selfIntroSelect;
import rom.db.resume.bld.selfIntroUpdate;
import rom.db.resume.bld.skillUpdate;
import rom.db.resume.bld.studyUpdate;
import rom.db.resume.bld.workUpdate;

public class rompageController extends HttpServlet implements Servlet{
	String resume = "/resume/";
	String portfolio = "/portfolio/";
	String admin = "/admin/";
	String main = "/main/";
	String login = "/login/";
	String lotto = "/lotto/";
	String gallery = "/gallery/";
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{	//泥섎━
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals(resume + "resume.cmd") || //이력서
				command.equals(admin + "resumeUpdate.cmd") ){ //이력서
			action = new resumeSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(portfolio + "portfolio.cmd") || //포트폴리오 
				command.equals(admin + "portfolioSelect.cmd")){ //관리자 포트폴리오 조회
			action = new portfolioSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(portfolio + "detail.cmd") || //포트폴리오 상세
				command.equals(admin + "portfolioUpdate.cmd") ){  //관리자 포트폴리오 수정
			action = new detailSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "portfolioInsert.cmd")){ //관리자 포트폴리오 등록
			forward = new ActionForward();
			forward.setPath("/rompage/admin/portfolioInsert.jsp");
		}else if(command.equals(admin + "portInsertAction.cmd")){ //관리자 포트폴리오 등록액션
			portfolioInsert bld = new portfolioInsert();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "detailInsertAction.cmd")){
			detailInsert bld = new detailInsert();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "portUpdateMultiAction.cmd")){ //관리자 포트폴리오 등록액션(파일포함)
			portfolioMultiUpdate bld = new portfolioMultiUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "portUpdateAction.cmd")){ //관리자 포트폴리오 등록액션
			portfolioUpdate bld = new portfolioUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "detailUpdateMultiAction.cmd")){ //관리자 포트폴리오 수정액션(파일포함)
			detailMultiUpdate bld = new detailMultiUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "detailUpdateAction.cmd")){ //관리자 포트폴리오 수정액션(파일포함)
			detailUpdate bld = new detailUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "detailDeleteAction.cmd")){ //관리자 포트폴리오 수정액션(파일포함)
			detailDelete bld = new detailDelete();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "portViewUpdateAction.cmd")){ //관리자 포트폴리오 출력여부수정액션
			portfolioViewUpdate bld = new portfolioViewUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "portfolioDeleteAction.cmd")){ //관리자 포트폴리오 삭제
			portfolioDelete bld = new portfolioDelete();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "infoUpdateAction.cmd")){ //관리자 이력서 기본정보 수정
			infoUpdate bld = new infoUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "infoUpdateMultiAction.cmd")){ //관리자 이력서 기본정보 수정(이미지포함)
			infoMultiUpdate bld = new infoMultiUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "workUpdate.cmd")){ //관리자 이력서 이력 수정
			workUpdate bld = new workUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "projectUpdate.cmd")){ //관리자 이력서 프로젝트 수정
			projectUpdate bld = new projectUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "licenseUpdate.cmd")){ //관리자 이력서 교육이수내역 수정
			licenseUpdate bld = new licenseUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "skillUpdate.cmd")){ //관리자 이력서 보유기술 및 능력 수정
			skillUpdate bld = new skillUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "studyUpdate.cmd")){ //관리자 이력서 보유기술 및 능력 수정
			studyUpdate bld = new studyUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "familyUpdate.cmd")){ //관리자 이력서 가족관계 수정
			familyUpdate bld = new familyUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "schoolInsert.cmd")){ //관리자 이력서 학력 등록
			schoolInsert bld = new schoolInsert();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "schoolDelete.cmd")){ //관리자 이력서 학력 삭제
			schoolDelete bld = new schoolDelete();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "schoolUpdate.cmd")){ //관리자 이력서 학력 수정
			schoolUpdate bld = new schoolUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "schoolMultiUpdate.cmd")){ //관리자 이력서 학력 수정(사진포함)
			schoolMultiUpdate bld = new schoolMultiUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(resume + "selfIntroduction.cmd") || //자기소개서
				command.equals(admin + "selfIntroUpdate.cmd") ){ //관리자 자기소개서
			action = new selfIntroSelect();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(admin + "selfIntroUpdateAction.cmd")){ //관리자 자기소개서 등록
			selfIntroUpdate bld = new selfIntroUpdate();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(main + "main.cmd")){ //메인
			forward = new ActionForward();
			forward.setPath("/rompage/main/main.jsp");
		}else if(command.equals(login + "login.cmd")){ //로그인
			forward = new ActionForward();
			forward.setPath("/rompage/login/login.jsp");
		}else if(command.equals(login + "loginAction.cmd")){ //로그인 버튼 클릭시
			loginSelect bld = new loginSelect();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(login + "logout.cmd")){ //로그아웃
			logout bld = new logout();
			try {
				bld.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "lotto.cmd")){ //로또
			forward = new ActionForward();
			forward.setPath("/v1/lotto/lotto.jsp");
		}else if(command.equals(lotto + "create.cmd")){ //로또 create
			LottoAction bld = new LottoAction();
			try {
				bld.create(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "insert.cmd")){ //로또 insert
			LottoAction bld = new LottoAction();
			try {
				bld.insert(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "list.cmd")){ //로또 list
			LottoAction bld = new LottoAction();
			try {
				bld.list(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "delete.cmd")){ //로또 delete
			LottoAction bld = new LottoAction();
			try {
				bld.delete(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "update.cmd")){ //로또 update
			LottoAction bld = new LottoAction();
			try {
				bld.update(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(lotto + "result.cmd")){ //로또 result
			LottoAction bld = new LottoAction();
			try {
				bld.result(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals(gallery + "gallery.cmd")){ //갤러리
			forward = new ActionForward();
			forward.setPath("/rompage/gallery/gallery.jsp");
		}
		
		if(forward!=null){
			if(forward.isRedirect()){	 
				response.sendRedirect(forward.getPath());
			}else{	
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	//get諛⑹떇 泥섎━ 
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	//post諛⑹떇 泥섎━
		doProcess(request, response);
	}
}
