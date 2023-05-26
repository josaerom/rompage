package rom.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author rom
 * 설명 : requst, response 처리를 위한 interface
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
public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
