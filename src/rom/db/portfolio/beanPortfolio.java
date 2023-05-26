package rom.db.portfolio;

import java.util.Date;
import java.text.SimpleDateFormat;
/**
 * 
 * @author rom
 * 설명 : 포트폴리오
 * 
 * 최초 작성자 : 조새롬
 * 최초 작설날짜 : 2016-09-01
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 : 
 * 수정 목적 : 
 *
 */
public class beanPortfolio {
	private String U_ID; //아이디
	private int PNUM; //부모번호
	private String RNUM; //번호	
	private String THUMBNAIL_IMG; //썸네일 이미지
	private String THUMBNAIL_MEMO; //썸네일 설명
	private String ORDER_ORG; //발주처
	private String SDATE; //시작일
	private String EDATE; //종료일
	private String CONTENT; //내용
	private String VIEW_YN; //노출여부
	private String UDATE; //등록일
	private String PERSONNEL; //참여인원
	private String PERCENT; //참여도
	private String TECHNIC; //사용기술&언어
	
	public String getPERSONNEL() {
		return PERSONNEL;
	}
	public String getPERCENT() {
		return PERCENT;
	}
	public String getTECHNIC() {
		return TECHNIC;
	}
	public void setPERSONNEL(String pERSONNEL) {
		PERSONNEL = pERSONNEL;
	}
	public void setPERCENT(String pERCENT) {
		PERCENT = pERCENT;
	}
	public void setTECHNIC(String tECHNIC) {
		TECHNIC = tECHNIC;
	}
	private String IMG; //상세 이미지
	private String MEMO; //상세 설명
	
	public String getRNUM() {
		return RNUM;
	}
	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getU_ID() {
		return U_ID;
	}
	public String getTHUMBNAIL_IMG() {
		return THUMBNAIL_IMG;
	}
	public String getTHUMBNAIL_MEMO() {
		return THUMBNAIL_MEMO;
	}
	public String getORDER_ORG() {
		return ORDER_ORG;
	}
	public String getSDATE() {
		return SDATE;
	}
	public String getEDATE() {
		return EDATE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public String getVIEW_YN() {
		return VIEW_YN;
	}
	public String getUDATE() {
		return UDATE;
	}
	public void setU_ID(String u_ID) {
		U_ID = u_ID;
	}
	
	public void setTHUMBNAIL_IMG(String tHUMBNAIL_IMG) {
		THUMBNAIL_IMG = tHUMBNAIL_IMG;
	}
	public void setTHUMBNAIL_MEMO(String tHUMBNAIL_MEMO) {
		THUMBNAIL_MEMO = tHUMBNAIL_MEMO;
	}
	public void setORDER_ORG(String oRDER_ORG) {
		ORDER_ORG = oRDER_ORG;
	}
	public void setSDATE(String sDATE) {
		SDATE = sDATE;
	}
	public void setEDATE(String eDATE) {
		EDATE = eDATE;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public void setVIEW_YN(String vIEW_YN) {
		VIEW_YN = vIEW_YN;
	}
	public void setUDATE(String uDATE) {
		UDATE = uDATE;
	}
	public String getIMG() {
		return IMG;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setIMG(String iMG) {
		IMG = iMG;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	public int getPNUM() {
		return PNUM;
	}
	public void setPNUM(int pNUM) {
		PNUM = pNUM;
	}

	
}
