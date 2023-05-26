package rom.db.login;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rom.db.login.beanLogin;
import rom.db.login.loginDAO;

public class logout{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		boolean result = false;
		HttpSession session = request.getSession();		
		
		if(null != session.getAttribute("user")){
			System.out.println("들어오냐????");
			session.removeAttribute("user");
			result = true;
		}
		System.out.println(session.getAttribute("U_ID"));
		System.out.println(session.getAttribute("U_EMAIL"));
		PrintWriter out=response.getWriter();
		out.print("{\"result\" : \""+result+"\"}");
	}
}
