package rom.db.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import rom.db.resume.beanInfo;
import rom.util.defaultUtil;

/**
 * 
 * @author ci
 * 설명 : 다형성을 위한 데이터베이스 추상클래스
 * 
 * 최초 작성자 : 조새롬
 * 최초 작성날짜 : 2013-10-23
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 : 
 * 수정 목적 : 
 *
 */
public class loginDAO {	
	DataSource ds;
	Connection con;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pStmt;
	
	defaultUtil util = new defaultUtil();
	
	//생성자 디비 연결
	public loginDAO(){
		try {
			InitialContext initCtx = new InitialContext();
			ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		} catch (Exception ex) {
			System.out.println("DB연결 실패" + ex);
			ex.printStackTrace();
			return;
		}
	}
	//로그인 정보 조회
	public beanLogin loginSelect(String uId, String uPass) throws Exception {
		beanLogin bean = new beanLogin();
		
		String sql = "";
		con = ds.getConnection();
		
		sql = "select U_ID, U_PASSWORD, U_NAME, U_TELL, U_EMAIL, U_REG_DATE, U_AUTH "+
				" from TB_AD_USER "+
				" where U_ID ='" + uId+"'"+
				" and U_PASSWORD ='" + uPass+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){			
			bean.setU_ID(rs.getString("U_ID"));
			bean.setU_PASSWORD(rs.getString("U_PASSWORD"));
			bean.setU_NAME(rs.getString("U_NAME"));
			bean.setU_TELL(rs.getString("U_TELL"));
			bean.setU_EMAIL(rs.getString("U_EMAIL"));
			bean.setU_REG_DATE(rs.getString("U_REG_DATE"));
			bean.setU_AUTH(rs.getString("U_AUTH"));		
			System.out.println(rs.getString("U_AUTH"));
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return bean;		
	}
}
