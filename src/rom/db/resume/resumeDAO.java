package rom.db.resume;

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
public class resumeDAO {	
	DataSource ds;
	Connection con;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pStmt;
	
	defaultUtil util = new defaultUtil();
	
	//생성자 디비 연결
	public resumeDAO(){
		try {
			InitialContext initCtx = new InitialContext();
			ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
		} catch (Exception ex) {
			System.out.println("DB연결 실패" + ex);
			ex.printStackTrace();
			return;
		}
	}
	//기본정보 조회
	public beanInfo infoSelect(String uId) throws Exception {
		beanInfo bean = new beanInfo();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select B.U_ID, B.KOR_NAME, B.ENG_NAME1, B.ENG_NAME2, B.CHIN_NAME, B.SSN, B.GENDER, B.ADDR, B.TEL1, B.TEL2, B.TEL3, B.EMAIL, B.PHOTO "+
				" from TB_RS_BASIC B "+
				" where B.U_ID ='" + uId+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){			
			bean.setU_ID(rs.getString("U_ID"));
			bean.setKOR_NAME(rs.getString("KOR_NAME"));
			bean.setENG_NAME1(rs.getString("ENG_NAME1"));
			bean.setENG_NAME2(rs.getString("ENG_NAME2"));
			bean.setCHIN_NAME(rs.getString("CHIN_NAME"));
			
			if( !"".equals(rs.getString("SSN")) && rs.getString("SSN").length() > 7){
				
				Map ssnInfo = getAge(rs.getString("SSN"));
				
				bean.setAGE(ssnInfo.get("age").toString());
				bean.setGENDER(ssnInfo.get("gender").toString() );
				bean.setBIRTH(ssnInfo.get("birth").toString());
			}
			
			bean.setSSN(rs.getString("SSN"));
			
			
			bean.setGENDER(rs.getString("GENDER"));
			bean.setADDR(rs.getString("ADDR"));
			bean.setTEL1(rs.getString("TEL1"));
			bean.setTEL2(rs.getString("TEL2"));
			bean.setTEL3(rs.getString("TEL3"));
			bean.setEMAIL(rs.getString("EMAIL"));
			bean.setPHOTO(rs.getString("PHOTO"));
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return bean;		
	}
	
	//주민등록번호로 나이, 성별, 생년월일 구하기
	 private Map getAge(String num) throws Exception {
		 int year, month, day, age, sex, local;
		 Calendar date = Calendar.getInstance();
		 
		 char gender = num.charAt(7);
	     year = Integer.parseInt(num.substring(0, 2));
	     month = Integer.parseInt(num.substring(2, 4));
	     day = Integer.parseInt(num.substring(4, 6));
	     int sex1 = 0;
	        
	     // 7번째 숫자로 성별, 년도, 내/외국인 확인
	     switch (gender) {
	        case '1':
	            year += 1900;
	            sex1 = 0;
	            local = 1;
	            break;
	        case '2':
	            year += 1900;
	            sex1 = 1;
	            local = 1;
	            break;
	        case '3':
	            year += 2000;
	            sex1 = 0;
	            local = 1;
	            break;
	        case '4':
	            year += 2000;
	            sex1 = 1;
	            local = 1;
	            break;
	        case '5':
	            year += 1900;
	            sex1 = 0;
	            local = 0;
	            break;
	        case '6':
	            year += 1900;
	            sex1 = 1;
	            local = 0;
	            break;
	        case '7':
	            year += 2000;
	            sex1 = 0;
	            local = 0;
	            break;
	        case '8':
	            year += 2000;
	            sex1 = 1;
	            local = 0;
	            break;
	        case '9':
	            year += 1800;
	            sex1 = 0;
	            local = 1;
	            break;
	        case '0':
	            year += 1800;
	            sex1 = 1;
	            local = 1;
	            break;
	        }
	        age = (date.get(Calendar.YEAR)) - year + 1;
	 
	        char sexchk = sex1 == 1 ? '남' : '여';
	        Map list = new HashMap();
	        list.put("gender", sexchk);
	        list.put("age", age);
	        list.put("birth", year + "." + month + "." + day);
	        
	        return list;
	}
	
	//이력 조회
	public List selectWork(String uId) throws Exception {
		
		List list = new ArrayList();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, SDATE, EDATE, WORK_MON, WORK_NAME, WORK_TEAM, PART, RESIGN_REASON, MONEY "+
				" from TB_RS_WORK "+
				" where U_ID= '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanWork bean = new beanWork();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setWORK_MON(rs.getString("WORK_MON"));
			bean.setWORK_NAME(rs.getString("WORK_NAME"));
			bean.setWORK_TEAM(rs.getString("WORK_TEAM"));
			bean.setPART(rs.getString("PART"));
			bean.setRESIGN_REASON(rs.getString("RESIGN_REASON"));
			bean.setMONEY(rs.getString("MONEY"));		
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//프로젝트 수행 조회
	public List selectProject(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, SDATE, EDATE, POSITION, ORDER_ORG, DUTY, WORK_NAME, MEMO "+
			"from TB_RS_PROJECT "+
			"where U_ID = '" + uId+"'" +
			"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanProject bean = new beanProject();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setPOSITION(rs.getString("POSITION"));
			bean.setORDER_ORG(rs.getString("ORDER_ORG"));
			bean.setDUTY(rs.getString("DUTY"));
			bean.setWORK_NAME(rs.getString("WORK_NAME"));
			bean.setMEMO(rs.getString("MEMO"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//자격/면허
	public List selectLicense(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, NAME, ISSU_ORG, GET_DATE, RESULTS "+
				"from TB_RS_LICENSE "+
				"where U_ID = '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanLicense bean = new beanLicense();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setNAME(rs.getString("NAME"));
			bean.setISSU_ORG(rs.getString("ISSU_ORG"));
			bean.setGET_DATE(rs.getString("GET_DATE"));
			bean.setRESULTS(rs.getString("RESULTS"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//보유기술 및 능력
	public List selectSkill(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, SKILL_NAME, LEVEL, MEMO "+
				"from TB_RS_SKILL "+
				"where U_ID = '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanSkill bean = new beanSkill();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setSKILL_NAME(rs.getString("SKILL_NAME"));
			bean.setLEVEL(rs.getString("LEVEL"));
			bean.setMEMO(rs.getString("MEMO"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//교육이수내역
	public List selectStudy(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, SDATE, EDATE, NAME, ORG_NAME, CONTENT, MEMO "+
				"from TB_RS_STUDY "+
				"where U_ID = '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanStudy bean = new beanStudy();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setNAME(rs.getString("NAME"));
			bean.setORG_NAME(rs.getString("ORG_NAME"));
			bean.setCONTENT(rs.getString("CONTENT"));
			bean.setMEMO(rs.getString("MEMO"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//학력
	public List selectSchool(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, GUBUN, SDATE, EDATE, NAME, MAJOR, ADDR, MEMO, PHOTO, RESULTS "+
				"from TB_RS_SCHOOL "+
				"where U_ID = '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanSchool bean = new beanSchool();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setRNUM(rs.getString("R_NUM"));
			bean.setGUBUN(rs.getString("GUBUN"));
			bean.setSDATE(rs.getString("SDATE"));
			bean.setEDATE(rs.getString("EDATE"));
			bean.setNAME(rs.getString("NAME"));
			bean.setMAJOR(rs.getString("MAJOR"));
			bean.setADDR(rs.getString("ADDR"));
			bean.setMEMO(rs.getString("MEMO"));
			bean.setPHOTO(rs.getString("PHOTO"));
			bean.setRESULTS(rs.getString("RESULTS"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//가족관계
	public List selectFamily(String uId) throws Exception {		
		List list = new ArrayList();		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, R_NUM, REL, NAME, BIRTH, SCHOOL, JOB, LIVE_YN "+
				"from TB_RS_FAMILY "+
				"where U_ID = '" + uId+"'" +
				"order by R_NUM desc ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			beanFamily bean = new beanFamily();
			bean.setU_ID(rs.getString("U_ID"));
			bean.setR_NUM(rs.getString("R_NUM"));
			bean.setREL(rs.getString("REL"));
			bean.setNAME(rs.getString("NAME"));
			bean.setBIRTH(rs.getString("BIRTH"));
			bean.setSCHOOL(rs.getString("SCHOOL"));
			bean.setJOB(rs.getString("JOB"));
			bean.setLIVE_YN(rs.getString("LIVE_YN"));
			list.add(bean);
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return list;		
	}
	
	//기본정보 수정
	public boolean infoUpdate(beanInfo bean) throws Exception{
		boolean result = false;
		String sql = "";
		con = ds.getConnection();
		sql = "update TB_RS_BASIC"
				+ " set KOR_NAME = ? "
				+ " , ENG_NAME1 = ? "
				+ " , ENG_NAME2 = ? "
				+ " , CHIN_NAME = ? "
				+ " , SSN = ? "
				+ " , ADDR = ? "
				+ " , TEL1 = ? "
				+ " , TEL2 = ? "
				+ " , TEL3 = ? "
				+ " , EMAIL = ? ";
		if(bean.getPHOTO() != null){
			sql += " , PHOTO = ? ";
		}
		
		sql += " where  U_ID = ?";
				
		pStmt = con.prepareStatement(sql);
		pStmt.setString(1, bean.getKOR_NAME());
		pStmt.setString(2, bean.getENG_NAME1());
		pStmt.setString(3, bean.getENG_NAME2());
		pStmt.setString(4, bean.getCHIN_NAME());
		pStmt.setString(5, bean.getSSN());
		pStmt.setString(6, bean.getADDR());
		pStmt.setString(7, bean.getTEL1());
		pStmt.setString(8, bean.getTEL2());
		pStmt.setString(9, bean.getTEL3());
		pStmt.setString(10, bean.getEMAIL());
		if(bean.getPHOTO() != null){
			pStmt.setString(11, bean.getPHOTO());
			pStmt.setString(12, bean.getU_ID());
		}else{
			pStmt.setString(11, bean.getU_ID());
		}
		
		
		pStmt.executeUpdate();
		//stmt = con.createStatement();
		//stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//이력서 삭제
	public boolean resumDelete(String uId, String tableNm) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "delete from " + tableNm
				+ " where  U_ID = '" + uId+"'";

		stmt = con.createStatement();
		stmt.executeUpdate(sql);		
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//이력 수정
	public boolean workUpdate(beanWork bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_WORK ( SDATE, EDATE, WORK_MON, WORK_NAME, "
				+ " WORK_TEAM, PART, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getSDATE()+"' "
				+ " , '"+bean.getEDATE()+"' "
				+ " , '"+bean.getWORK_MON()+"' "
				+ " , '"+bean.getWORK_NAME()+"' "
				+ " , '"+bean.getWORK_TEAM()+"' "
				+ " , '"+bean.getPART()+"' "
				+ " , '" + bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 프로젝트 수정
	public boolean projectUpdate(beanProject bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_PROJECT ( SDATE, EDATE, POSITION, ORDER_ORG, "
				+ " DUTY, WORK_NAME, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getSDATE()+"' "
				+ " , '"+bean.getEDATE()+"' "
				+ " , '"+bean.getPOSITION()+"' "
				+ " , '"+bean.getORDER_ORG()+"' "
				+ " , '"+bean.getDUTY()+"' "
				+ " , '"+bean.getWORK_NAME()+"' "
				+ " , '" + bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 자격/면허 수정
	public boolean licenseUpdate(beanLicense bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_LICENSE ( NAME, ISSU_ORG, GET_DATE, RESULTS, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getNAME()+"' "
				+ " , '"+bean.getISSU_ORG()+"' "
				+ " , '"+bean.getGET_DATE()+"' "
				+ " , '"+bean.getRESULTS()+"' "
				+ " , '"+bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 보유기술 및 능력 수정
	public boolean skillUpdate(beanSkill bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_SKILL ( SKILL_NAME, LEVEL, MEMO, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getSKILL_NAME()+"' "
				+ " , '"+bean.getLEVEL()+"' "
				+ " , '"+bean.getMEMO()+"' "
				+ " , '"+bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 교육이수내역 수정
	public boolean studyUpdate(beanStudy bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_STUDY ( SDATE, EDATE, NAME, ORG_NAME, CONTENT, MEMO, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getSDATE()+"' "
				+ " , '"+bean.getEDATE()+"' "
				+ " , '"+bean.getNAME()+"' "
				+ " , '"+bean.getORG_NAME()+"' "
				+ " , '"+bean.getCONTENT()+"' "
				+ " , '"+bean.getMEMO()+"' "
				+ " , '"+bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 가족관계 수정
	public boolean familyUpdate(beanFamily bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_FAMILY ( REL, NAME, BIRTH, LIVE_YN, SCHOOL, JOB, U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getREL()+"' "
				+ " , '"+bean.getNAME()+"' "
				+ " , '"+bean.getBIRTH()+"' "
				+ " , '"+bean.getLIVE_YN()+"' "
				+ " , '"+bean.getSCHOOL()+"' "
				+ " , '"+bean.getJOB()+"' "
				+ " , '"+bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	// 학력 입력
	public boolean schoolInsert(beanSchool bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "INSERT INTO TB_RS_SCHOOL ( PHOTO, GUBUN, NAME, MAJOR, ADDR, RESULTS, SDATE,EDATE,  U_ID ) "
				+ " VALUES ( "
				+ " '"+bean.getPHOTO()+"' "
				+ " , '"+bean.getGUBUN()+"' "
				+ " , '"+bean.getNAME()+"' "
				+ " , '"+bean.getMAJOR()+"' "
				+ " , '"+bean.getADDR()+"' "
				+ " , '"+bean.getRESULTS()+"' "
				+ " , '"+bean.getSDATE()+"' "
				+ " , '"+bean.getEDATE()+"' "
				+ " , '"+bean.getU_ID()+"' )";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//학력 삭제
	public boolean schoolDelete(beanSchool bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "delete from TB_RS_SCHOOL"
				+ " where R_NUM = " + bean.getRNUM()+""
				+ " and U_ID = '" + bean.getU_ID()+"'";

		stmt = con.createStatement();
		stmt.executeUpdate(sql);		
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//기본정보 수정
	public boolean schoolUpdate(beanSchool bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "update TB_RS_SCHOOL"
				+ " set GUBUN = '"+bean.getGUBUN()+"' "
				+ " , NAME = '"+bean.getNAME()+"' "
				+ " , MAJOR = '"+bean.getMAJOR()+"' "
				+ " , ADDR = '"+bean.getADDR()+"' "
				+ " , RESULTS = '"+bean.getRESULTS()+"' "
				+ " , SDATE = '"+bean.getSDATE()+"' "
				+ " , EDATE = '"+bean.getEDATE()+"' ";
		if(bean.getPHOTO() != null){
			sql += " , PHOTO = '"+bean.getPHOTO()+"' ";
		}
		sql += " where R_NUM = '" + bean.getRNUM()+"'";
		sql += " and  U_ID = '" + bean.getU_ID()+"'";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
	//자기소개서 조회
	public beanSelfIntro selfIntroSelect(String uId) throws Exception {
		beanSelfIntro bean = new beanSelfIntro();
		
		String sql = "";
		con = ds.getConnection();
		sql = "select U_ID, TITLE, INTRO, GROW, CHARACTER_YN, APPL_REASON, HOPE, SPECIAL "+
				 " from TB_RS_INTRODUCE "+
				" where U_ID ='" + uId+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){			
			bean.setU_ID(rs.getString("U_ID"));
			bean.setTITLE(rs.getString("TITLE"));
			bean.setINTRO(rs.getString("INTRO"));
			bean.setGROW(rs.getString("GROW"));
			bean.setCHARACTER_YN(rs.getString("CHARACTER_YN"));
			bean.setAPPL_REASON(rs.getString("APPL_REASON"));
			bean.setHOPE(rs.getString("HOPE"));
			bean.setSPECIAL(rs.getString("SPECIAL"));
		}
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		
		return bean;		
	}
	//자기소개서 등록 또는 수정
	public boolean selfIntroInsert(beanSelfIntro bean) throws Exception{
		boolean result = false;
		
		String sql = "";
		con = ds.getConnection();
		sql = "select * "+
				 " from TB_RS_INTRODUCE "+
				" where U_ID ='" + bean.getU_ID()+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		int row = 0;
		if(rs.last()){
			row = rs.getRow();
		}
		if(row > 0){
			sql = "update TB_RS_INTRODUCE"
					+ " set INTRO = '"+bean.getINTRO()+"' "
					+ " , TITLE = '"+bean.getTITLE()+"' "
					+ " , GROW = '"+bean.getGROW()+"' "
					+ " , CHARACTER_YN = '"+bean.getCHARACTER_YN()+"' "
					+ " , APPL_REASON = '"+bean.getAPPL_REASON()+"' "
					+ " , HOPE = '"+bean.getHOPE()+"' "
					+ " , SPECIAL = '"+bean.getSPECIAL()+"' "
					+ " where  U_ID = '" + bean.getU_ID()+"'";	
		}else{
			sql = "insert into TB_RS_INTRODUCE (U_ID, TITLE, INTRO, GROW, CHARACTER_YN, APPL_REASON, HOPE, SPECIAL)"
					+ " VALUES ('" + bean.getU_ID()+"', '"+bean.getTITLE()+"', '"+bean.getINTRO()+"', '"+bean.getGROW()+"', '"+bean.getCHARACTER_YN()+"', "
							+ " '"+bean.getAPPL_REASON()+"', '"+bean.getHOPE()+"', '"+bean.getSPECIAL()+"' ) ";			
		}
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(con!=null) try{con.close();}catch(SQLException ex){}
		result = true;
		
		return result;
	}
}
