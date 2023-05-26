package rom.db.resume;

/**
 * 
 * @author rom
 * @category 자기소개서
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
public class beanSelfIntro {
	private String U_ID;//아이디
	private String INTRO;//이력서
	private String GROW;//성장과정
	private String CHARACTER_YN;//성격의 장단점
	private String APPL_REASON;//지원동기
	private String HOPE;//입사 후 포부
	private String SPECIAL;//특기사항
	private String TITLE;//제목
	
	public String getU_ID() {
		return U_ID;
	}
	public String getINTRO() {
		return INTRO;
	}
	public String getGROW() {
		return GROW;
	}
	public String getCHARACTER_YN() {
		return CHARACTER_YN;
	}
	public String getAPPL_REASON() {
		return APPL_REASON;
	}
	public String getHOPE() {
		return HOPE;
	}
	public String getSPECIAL() {
		return SPECIAL;
	}
	public void setU_ID(String u_ID) {
		U_ID = u_ID;
	}
	public void setINTRO(String iNTRO) {
		INTRO = iNTRO;
	}
	public void setGROW(String gROW) {
		GROW = gROW;
	}
	public void setCHARACTER_YN(String cHARACTER_YN) {
		CHARACTER_YN = cHARACTER_YN;
	}
	public void setAPPL_REASON(String aPPL_REASON) {
		APPL_REASON = aPPL_REASON;
	}
	public void setHOPE(String hOPE) {
		HOPE = hOPE;
	}
	public void setSPECIAL(String sPECIAL) {
		SPECIAL = sPECIAL;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	
}
