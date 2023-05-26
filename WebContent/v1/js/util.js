(function(rom){
	var self = {};
	
	//공백체크
	self.isNull = function(arg){
		return arg == undefined || arg == null || arg == '';
	}
	//날짜체크
	self.isValidDate = function(date) {
		date = self.removeDelimiter(date);
		var dateReg = /^[0-9]{4}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		return dateReg.test(date);
	};
	
	self.removeDelimiter = function(arg) {
		arg = (arg === undefined || arg === null) ? '' : arg;
		return (arg + '').replace(/[,\/\.-]/g, '');
	};
	
	//파일 업로드시 바로 출력
	self.readURL = function(input, imgClass) {
		if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(input).prev('div').find('.'+imgClass).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	/***************************************************************************
	 * 유효성체크 field - 유효성체크할 객체명 patten - 패턴변수(regNum, regPhone, regMail....)
	 * name - 경고메세지 앞 타이틀 obj - 포커싱할 오브젝트(필드)
	 **************************************************************************/
	self.chkPatten = function(field, patten) {
		var regExp = null;

		if(patten == 'regNum'){
			regExp = /^[0-9]+$/;
		}else if(patten == 'regPhone'){
			regExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		}else if(patten == 'regIdNum'){
			regExp = /\d{6}[1234]\d{6}$/;
		}else if(patten == 'regMail'){
			regExp = /^[_a-zA-Z0-9-\.]+@[._a-zA-Z0-9-]+\.[a-zA-Z]+$/;
		}else if(patten == 'regDate'){
			regExp = /^[0-9]{4}.[0-1]{1}[0-9]{1}.[0-3]{1}[0-9]{1}$/;
		}else if(patten == 'regDateyyyyMM'){
			regExp = /^[0-9]{4}[0-1]{1}[0-9]{1}$/;
		}else if(patten == 'regDateyyMMdd'){
			regExp = /^[0-9]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		}else if(patten == 'regDateDel'){
			regExp = /^[0-9]{4}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		}else if(patten == 'regAlpha'){
			regExp = /^[a-zA-Z]+$/;
		}else if(patten == 'regKor'){
			regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힇]+$/;
		}

		if (typeof field == "string") {
			if (!regExp.test(field)) {				
				return false;
			}
		}
		return true;
	};
	
	/* RESIST */
	if(!rom){
		window.rom = rom = {};
	}
	rom.util = self;
})(window.rom);