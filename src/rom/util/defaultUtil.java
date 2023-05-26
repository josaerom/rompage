package rom.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class defaultUtil {
	public String strEuckr(String str){
		String euckr = "";
		if(str == null){
			str = "-";
		}
		try {
			euckr = new String(str.getBytes("8859_1"),"EUC-KR");						
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		return euckr;
	}
	
	public void checkAge(){
		Date currentTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String time = sdf.format(currentTime);
		
		String cusno = "8803202";
		String yycusno = "";
		
		if(Integer.parseInt(cusno.substring(6,7))>2){
			yycusno = "20"+cusno.substring(0,6);
		}else{
			yycusno = "19"+cusno.substring(0,6);
		}
		
		int year = Integer.parseInt(time.substring(0,4)) - Integer.parseInt(yycusno.substring(0,4)) -1;
		int month = Integer.parseInt(time.substring(4,6)) - Integer.parseInt(yycusno.substring(4,6));
		int day = Integer.parseInt(yycusno.substring(6,8)) - Integer.parseInt(time.substring(6,8));
		if(month >= 0){
			if(day <= 0){ //생일지남
				year = Integer.parseInt(time.substring(0,4)) - Integer.parseInt(yycusno.substring(0,4));
			}
		}
		//result year
	}
}
