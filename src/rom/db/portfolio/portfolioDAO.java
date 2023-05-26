package rom.db.portfolio;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import rom.util.defaultUtil;

import com.google.gson.Gson;
/**
 * 
 * @author rom
 * 설명 : 포트폴리오 쿼리문
 * 
 * 최초 작성자 : 조새롬
 * 최초 작성날짜 : 2016-09-01
 * 연락처 : 010-2369-2563
 * 
 * 수정 작성자 : 
 * 최종 수정날짜 : 
 * 수정 목적 : 
 *
 */
public class portfolioDAO {	
	DataSource ds;
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	defaultUtil util = new defaultUtil();
	
	//생성자 디비 연결
	public portfolioDAO(){
		try {
			InitialContext initCtx = new InitialContext();
			ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		} catch (Exception ex) {
			System.out.println("DB연결 실패" + ex);
			ex.printStackTrace();
			return;
		}
	}
	//포트폴리오 메인
	public List portMainSelect(String uId, String whereViewYn, String Sort) throws Exception {
		List list = new ArrayList();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, THUMBNAIL_IMG, THUMBNAIL_MEMO, ORDER_ORG, SDATE, EDATE, CONTENT, VIEW_YN, UDATE "+
				" from TB_PP_MAIN "+
				" where U_ID ='" + uId+"'"+
				" "+ whereViewYn +" "+
				" order by R_NUM " + Sort;
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanPortfolio bean = new beanPortfolio();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setRNUM(rs.getString("R_NUM"));
			bean.setTHUMBNAIL_IMG(rs.getString("THUMBNAIL_IMG"));
			bean.setTHUMBNAIL_MEMO(rs.getString("THUMBNAIL_MEMO"));
			bean.setORDER_ORG(rs.getString("ORDER_ORG"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setUDATE(rs.getString("U_ID"));
			bean.setVIEW_YN(rs.getString("VIEW_YN"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//포트폴리오 디테일 속 메인정보
	public beanPortfolio portInfoSelect(String uId, int pNum) throws Exception {
		beanPortfolio bean = new beanPortfolio();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select R_NUM, THUMBNAIL_IMG, THUMBNAIL_MEMO, ORDER_ORG, SDATE, EDATE, CONTENT, VIEW_YN, PERSONNEL, PERCENT, TECHNIC "+
				" from TB_PP_MAIN "+
				" where R_NUM = "+pNum
				+ " and  U_ID = '" + uId+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			bean.setRNUM(rs.getString("R_NUM"));
			bean.setTHUMBNAIL_IMG(rs.getString("THUMBNAIL_IMG"));
			bean.setTHUMBNAIL_MEMO(rs.getString("THUMBNAIL_MEMO"));
			bean.setORDER_ORG(rs.getString("ORDER_ORG"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setCONTENT(rs.getString("CONTENT"));
			bean.setVIEW_YN(rs.getString("VIEW_YN"));
			bean.setPERSONNEL(rs.getString("PERSONNEL"));
			bean.setPERCENT(rs.getString("PERCENT"));
			bean.setTECHNIC(rs.getString("TECHNIC"));
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return bean;
	}
	
	//포트폴리오 디테일
	public List portDetailSelect(int pNum) throws Exception {
		List list = new ArrayList();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select d.P_NUM, d.R_NUM, d.IMG, d.MEMO "+
				" from TB_PP_MAIN m, TB_PP_DETAIL d "+
				" where m.R_NUM = d.P_NUM "
					+ " and d.P_NUM = "+pNum+" "
					+ " order by d.R_NUM; ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanPortfolio bean = new beanPortfolio();
			bean.setPNUM(rs.getInt("P_NUM"));
			bean.setRNUM(rs.getString("R_NUM"));
			bean.setIMG(rs.getString("IMG"));
			bean.setMEMO(rs.getString("MEMO"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
		
	//포트폴리오 메인등록
	public int portfolioInsert(beanPortfolio bean) throws Exception{
		boolean result = false;
		int rNum = 0;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_PP_MAIN (U_ID, THUMBNAIL_IMG, THUMBNAIL_MEMO, ORDER_ORG, "
				+ " SDATE, EDATE, CONTENT, VIEW_YN, UDATE ) "
				+ " VALUES('"+bean.getU_ID()+"', '"+bean.getTHUMBNAIL_IMG()+"', '"+bean.getTHUMBNAIL_MEMO()+"', '"+bean.getORDER_ORG()+"', "
				+ " '"+bean.getSDATE()+"', '"+bean.getEDATE()+"', '"+bean.getCONTENT()+"', '"+bean.getVIEW_YN()+"', sysdate()) ";
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		sql = "select max(R_NUM) R_NUM from TB_PP_MAIN"; //등록된 메인 번호R_NUM
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			rNum = rs.getInt("R_NUM");
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return rNum;
	}
	
	//포트폴리오 메인등록
	public boolean detailInsert(beanPortfolio bean) throws Exception{
		boolean result = false;
		int rNum = 0;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_PP_DETAIL (U_ID, P_NUM, IMG, MEMO, UDATE ) "
				+ " VALUES('"+bean.getU_ID()+"', "+bean.getPNUM()+", '"+bean.getIMG()+"', '"+bean.getMEMO()+"', sysdate()) ";
		System.out.println(sql);
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		result = true;
		
		return result;
	}
	
	//포트폴리오 메인수정
	public boolean portfolioUpdate(beanPortfolio bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "update TB_PP_MAIN"
				+ " set THUMBNAIL_MEMO = '"+bean.getTHUMBNAIL_MEMO()+"' "
				+ " , ORDER_ORG = '"+bean.getORDER_ORG()+"' "
				+ " , SDATE = '"+bean.getSDATE()+"' "
				+ " , EDATE = '"+bean.getEDATE()+"' "
				+ " , CONTENT = '"+bean.getCONTENT()+"' "
				+ " , VIEW_YN = '"+bean.getVIEW_YN()+"' ";
		
		if(bean.getTHUMBNAIL_IMG() != null){
			sql += " , THUMBNAIL_IMG ='"+bean.getTHUMBNAIL_IMG()+"'";
		}
		
		sql += " where R_NUM = "+bean.getRNUM()
		+ " and  U_ID = '" + bean.getU_ID()+"'";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	
	//포트폴리오 상세수정
	public boolean detailUpdate(beanPortfolio bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "update TB_PP_DETAIL"
				+ " set MEMO = '"+bean.getMEMO()+"' ";
		if(bean.getIMG() != null){
			sql += " , IMG ='"+bean.getIMG()+"'";
		}
		sql += " where P_NUM = "+bean.getPNUM()
			+ " and R_NUM = "+bean.getRNUM()
			+ " and  U_ID = '" + bean.getU_ID()+"'";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	
	//포트폴리오 상세삭제
	public boolean detailDelete(beanPortfolio bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "delete from TB_PP_DETAIL "
				+ " where P_NUM = "+bean.getPNUM()
				+ " and R_NUM = "+bean.getRNUM()
				+ " and  U_ID = '" + bean.getU_ID()+"'";

		stmt = con.createStatement();
		stmt.executeUpdate(sql);		
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//포트폴리오 출력여부 수정
	public boolean portfolioViewUpdate(beanPortfolio bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "update TB_PP_MAIN"
				+ " set VIEW_YN = '"+bean.getVIEW_YN()+"' "
				+ " where R_NUM = "+bean.getRNUM()
				+ " and  U_ID = '" + bean.getU_ID()+"'";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//포트폴리오 삭제
	public boolean portfolioDelete(beanPortfolio bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "delete from TB_PP_MAIN "
				+ " where R_NUM = "+bean.getRNUM()
				+ " and U_ID = '" + bean.getU_ID()+"'";

		stmt = con.createStatement();
		stmt.executeUpdate(sql);		
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
}
