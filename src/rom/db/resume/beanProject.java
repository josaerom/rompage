package rom.db.resume;

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
public class beanProject {
	private String U_ID; //아이디
	private String R_NUM; //고유번호
	private String SDATE;//시작일
	private String EDATE;//종료일
	private String POSITION;	//직책
	private String ORDER_ORG;//발주처
	private String DUTY;//수행업무
	private String WORK_NAME;//소속
	private String MEMO;//비고
	
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
	public String getPOSITION() {
		return POSITION;
	}
	public String getORDER_ORG() {
		return ORDER_ORG;
	}
	public String getDUTY() {
		return DUTY;
	}
	public String getWORK_NAME() {
		return WORK_NAME;
	}
	public String getMEMO() {
		return MEMO;
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
	public void setPOSITION(String pOSITION) {
		POSITION = pOSITION;
	}
	public void setORDER_ORG(String oRDER_ORG) {
		ORDER_ORG = oRDER_ORG;
	}
	public void setDUTY(String dUTY) {
		DUTY = dUTY;
	}
	public void setWORK_NAME(String wORK_NAME) {
		WORK_NAME = wORK_NAME;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	
	
}
