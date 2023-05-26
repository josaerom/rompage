package rom.db.login.bld;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.login.beanLogin;
import rom.db.login.loginDAO;

public class loginSelect{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		loginDAO dao = new loginDAO();
		boolean result = false;
		
		String uId = request.getParameter("id");
		String uPass = request.getParameter("pw");
		
		
		beanLogin info = new beanLogin();
		info = dao.loginSelect(uId, uPass);
		
		HttpSession session = request.getSession(true);
		
		if(null != info.getU_ID()){
			System.out.println("들어오냐????");
			Map list = new HashMap();
			list.put("U_ID", info.getU_ID());
			list.put("U_PASSWORD", info.getU_PASSWORD());
			list.put("U_NAME", info.getU_NAME());
			list.put("U_TELL", info.getU_TELL());
			list.put("U_EMAIL", info.getU_EMAIL());
			list.put("U_REG_DATE", info.getU_REG_DATE());
			list.put("U_AUTH", info.getU_AUTH());
			session.setAttribute("user", list);
			result = true;
		}
		System.out.println(session.getAttribute("U_ID"));
		System.out.println(session.getAttribute("U_EMAIL"));
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\"}");
	}
}
