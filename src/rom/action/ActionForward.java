package rom.action;
/**
 * 
 * @author rom
 * 설명 : response처리
 * 
 * 최초 작성자 : 조새롬
 * 최초 작성날짜 : 20160401
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 :  
 * 수정 목적 : 
 *
 */
public class ActionForward {
	private boolean isRedirect = false;
	private String path = null;
	public boolean isRedirect() {
		return isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
