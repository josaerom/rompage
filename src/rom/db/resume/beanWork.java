package rom.db.resume;

import java.util.Date;
import java.text.SimpleDateFormat;
/**
 * 
 * @author ci
 * 설명 : 게시판 글 등록
 * 
 * 최초 작성자 : 조새롬
 * 최초 작설날짜 : 2013-10-21
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 : 
 * 수정 목적 : 
 *
 */
public class beanWork {
	private String U_ID;
	private String R_NUM;
	private String SDATE;
	private String EDATE;
	private String WORK_NAME;	
	private String WORK_MON;
	private String WORK_TEAM;
	private String PART;
	private String RESIGN_REASON;
	private String MONEY;
	public String getU_ID() {
		return U_ID;
	}
	public String getR_NUM() {
		return R_NUM;
	}
	public String getSDATE() {
		return SDATE;
	}
	public String getEDATE() {
		return EDATE;
	}
	public String getWORK_MON() {
		return WORK_MON;
	}
	public String getWORK_NAME() {
		return WORK_NAME;
	}
	public String getWORK_TEAM() {
		return WORK_TEAM;
	}
	public String getPART() {
		return PART;
	}
	public String getRESIGN_REASON() {
		return RESIGN_REASON;
	}
	public String getMONEY() {
		return MONEY;
	}
	public void setU_ID(String u_ID) {
		U_ID = u_ID;
	}
	public void setR_NUM(String r_NUM) {
		R_NUM = r_NUM;
	}
	public void setSDATE(String sDATE) {
		SDATE = sDATE;
	}
	public void setEDATE(String eDATE) {
		EDATE = eDATE;
	}
	public void setWORK_MON(String wORK_MON) {
		WORK_MON = wORK_MON;
	}
	public void setWORK_NAME(String wORK_NAME) {
		WORK_NAME = wORK_NAME;
	}
	public void setWORK_TEAM(String wORK_TEAM) {
		WORK_TEAM = wORK_TEAM;
	}
	public void setPART(String pART) {
		PART = pART;
	}
	public void setRESIGN_REASON(String rESIGN_REASON) {
		RESIGN_REASON = rESIGN_REASON;
	}
	public void setMONEY(String mONEY) {
		MONEY = mONEY;
	}
	
}
