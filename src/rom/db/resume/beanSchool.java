package rom.db.resume;

/**
 * 
 * @author rom
 * @category 학력
 * 
 * 최초 작성자 : 조새롬
 * 최초 작설날짜 : 20160607
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 : 
 * 수정 목적 : 
 *
 */
public class beanSchool {
	private String U_ID;
	private String RNUM;
	private String GUBUN; //초중고대구분
	private String SDATE; //시작일
	private String EDATE; //종료일
	private String NAME; //기관명칭
	private String MAJOR; //과(고,대학교)
	private String ADDR; //기관주소
	private String MEMO; //메모
	private String PHOTO; //사진
	private String RESULTS; //졸업여부
	public String getU_ID() {
		return U_ID;
	}
	public String getGUBUN() {
		return GUBUN;
	}
	public String getSDATE() {
		return SDATE;
	}
	public String getEDATE() {
		return EDATE;
	}
	public String getNAME() {
		return NAME;
	}
	public String getMAJOR() {
		return MAJOR;
	}
	public String getADDR() {
		return ADDR;
	}
	public String getMEMO() {
		return MEMO;
	}
	public String getPHOTO() {
		return PHOTO;
	}
	public String getRESULTS() {
		return RESULTS;
	}
	public void setU_ID(String u_ID) {
		U_ID = u_ID;
	}
	public void setGUBUN(String gUBUN) {
		GUBUN = gUBUN;
	}
	public void setSDATE(String sDATE) {
		SDATE = sDATE;
	}
	public void setEDATE(String eDATE) {
		EDATE = eDATE;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public void setMAJOR(String mAJOR) {
		MAJOR = mAJOR;
	}
	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	public void setPHOTO(String pHOTO) {
		PHOTO = pHOTO;
	}
	public void setRESULTS(String rESULTS) {
		RESULTS = rESULTS;
	}
	public String getRNUM() {
		return RNUM;
	}
	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	
}
