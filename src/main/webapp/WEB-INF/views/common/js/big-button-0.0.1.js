
function resizeFrame(frm) {
	frm.style.height = "auto";
	contentHeight = frm.contentWindow.document.documentElement.scrollHeight;
	frm.style.height = contentHeight + 4 + "px";
}
//이미지 롤오버 효과
function menuOn(imgEl) {
	imgEl.src = imgEl.src.replace(".png", "-on.png");
}
function menuOut(imgEl) {
	imgEl.src = imgEl.src.replace("-on.png", ".png");
}

/*****  찬일  *****/

// 클릭이벤트 발생
function objClick(obj) {
    obj.click();
}

// 문자 앞 뒤 공백을 제거 한다.
String.prototype.trim = function() { 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}
String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}
String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}

// 한글만 체크
String.prototype.kor = function() {
	return (/^[ㄱ-ㅎ가-힣ㅏ-ㆌ]+$/).test(this);
}

// 한글만 체크
String.prototype.kornum = function() {
	return (/^[가-힣0-9]+$/).test(this);
}

// 숫자만 체크
String.prototype.onlyNum = function() {
	var num = this.trim();
	return (this.trim().replace(/[^0-9]/g,""));
}

// null은 아니며 값이 없는지
function isEmpty(s) {
if (s != null &&  s.trim() == "")
    return true;
return false;
}

// null 또는 값이 없는지
function isNull(s) {
if (s == null || s.trim() == "")
    return true;
return false;
}

// 숫자 입력 체크 (onblur에 이용)
function checkNaN(obj){
if (isNaN(obj.value))
{
		alert("숫자만 입력 하실 수 있습니다");
		obj.value = "";
		obj.focus();
		return false;
}
return true;
}


// input 숫자만 입력 가능(onkeyup에 이용)
function onlyNumber() {
    if (event.type.indexOf('key') < 0) {
        return;
    }
    var keyCode = event.keyCode ? event.keyCode :
                  event.which ? event.which : event.charCode;
    if (keyCode != 13) {

        if ((keyCode > 47 && keyCode < 58)) {
            event.returnValue = true;
        } else {
            event.returnValue = false;
        }
    }
}    

//=======================================
//  make decimal point to the decplace 
//  By Chan-Il
//=======================================		
function formatNumber (num, decplaces) {
    // convert in case it arrives as a string value
    num = parseFloat(num);
    // make sure it passes conversion
    if (!isNaN(num)) {
        // multiply value by 10 to the decplaces power;
        // round the result to the nearest integer;
        // convert the result to a string
        var str = "" + Math.round (eval(num) * Math.pow(10,decplaces));
        // exponent means value is too big or small for this routine
        if (str.indexOf("e") != -1) {
            return "Out of Range";
        }
        // if needed for small values, pad zeros
        // to the left of the number
        while (str.length <= decplaces) {
            str = "0" + str;
        }
        // calculate decimal point position
        var decpoint = str.length - decplaces;
        // assemble final result from: (a) the string up to the position of
        // the decimal point; (b) the decimal point; and (c) the balance
        // of the string. Return finished product.
        return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);
    } else {
        return "NaN";
    }
}


//=======================================
//  Focus Send To Next Tab By Return Key
//  By Chan-Il
//=======================================
function nexttab_return(obj,nextfocus){
	if ((event.keyCode=="13")||(event.keyCode=="\t")){
		eval(nextfocus+".focus();");
	}
}

//=======================================
//  Focus Send To Next Tab By Number Key
//  By Chan-Il
//=======================================
function nexttab_number(cn,obj,nextfocus){
    var code = event.keyCode ? event.keyCode :
           event.which ? event.which : event.charCode;
	var bReturnValue = false;
		if (event.type.indexOf('key') < 0) {
    	return;
		}

	    if (code > 222) return false;   // Select Box외 기타 이벤트 방지
	    if (code != 13) {
	        bReturnValue =
	        ( code >= 48 && code <= 57 ) //&& !event.shiftKey)     // Number
	                || code == 8                    // Backspace
	                || code == 9                    // Tab
	                || code == 18                   // Alt
	                || code == 20                   // Caps Lock
	         //     || code == 16                   // Shift //쉬프트 키를 누른 것 만으로는 정상으로 간주
	                || code == 45                   // Insert
	                || code == 46                   // Delete
	                || ( code >= 35 && code <= 40)  // Home,End 이어서 Cursor Key
	                || ( code >= 96 && code <= 105) // Key Pad
	        event.returnValue = bReturnValue;
	        if (bReturnValue == false) {
	            alert("숫자만 입력할 수 있습니다.");
	            obj.value = "";
	        }
	    }
	    

	if (bReturnValue==true && obj.value.length==cn){
		eval(nextfocus+".focus();");
	}
}

// new window Open
function windowOpen(url, name, width, height, scrollYN, ResizeYN) {
    var top = screen.height / 2 - height / 2 - 50;
    var left = screen.width / 2 - width / 2 ;
    if (scrollYN == null) scrollYN = 'no';
    if (ResizeYN == null) ResizeYN = 'no';
    var win;
    win = open(url, name, 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',resizable=' + ResizeYN + ',status=no,toolbar=no,menubar=no,scrollbars=' + scrollYN);
    win.focus();
    return win;
}

// ID check
function idChk(obj) {
	if(isEmpty(obj.value) ) {
		alert("아이디를 입력하십시오");
		obj.focus();
		return false;
	} 
	if (obj.value.indexOf(" ")>=0) {	
		alert("ID에 공백이 포함되어있습니다.\n공백을 제거해주세요.");
		obj.value = "";
		obj.focus();
		return false;
	}
	if(obj.value.length<3) {
		alert("아이디는 3자이상 이어야 합니다.\n아래 안내사항을 참조하세요.");
		obj.value = "";
		obj.focus();
		return false;
	}
	if(obj.value.length>20) {
		alert("아이디는 20자이하 이어야 합니다.\n아래 안내사항을 참조하세요.");
		obj.value = "";
		obj.focus();
		return false;
	}
	
	var symbol = new Array(".",",","~","`","!","#","@","$","%","^","&","*","=","+","|","<",">","?","/",";",":","[","]","{","}","'","\\","-","_");
	for(var i=0;i<symbol.length;i++) {
		if (obj.value.indexOf(symbol[i])>=0) {
			alert("ID에는 특수문자를 입력하실수 없습니다.");
			obj.value = "";
			obj.focus();
			return false;
		}
	}
	return true;
}

//password Check
function pwChk(obj1, obj2) {
	if (isEmpty(obj1.value) || isEmpty(obj2.value))	{
		alert("비밀번호또는 비밀번호 확인값이누락되었습니다. \n정확히 작성해주세요."); 
		obj1.focus();
		return false; 
	}
	if ( obj1.value != obj2.value ) {
		alert("비밀번호와 비밀번호 확인이 다릅니다.\n다시 정확히 작성해주세요.");
		obj1.value = "";
		obj2.value = "";
		obj1.focus();
		return false;
	}
	return true;
}

// 한글 이름 체크
function nameChk(obj) {
	if (isEmpty(obj.value) )	{
		alert("이름(한글)을 작성해주세요."); 
		obj.focus();
		return false; 
	}
	if ( !obj.value.kor() ) { 
		alert("이름(한글)은 반드시 한글로 작성해주세요."); 
		obj.value=""; 
		obj.focus();
		return false; 
	}
	if (obj.value.indexOf(" ")>=0) {	
		alert("이름에 공백이 포함되어있습니다.\n공백을 제거해주세요.");
		obj.value == "";
		obj.focus();
		return false;
	}
	if(obj.value.length<2) {
		alert("이름은 2자이상 이어야 합니다.");
		obj.value == "";
		obj.focus();
		return false;
	}
	if(obj.value.length>14) {
		alert("이름은 10자이하 이어야 합니다.");
		obj.value == "";
		obj.focus();
		return false;
	}
	var symbol = new Array(".",",","~","`","!","#","@","$","%","^","&","*","=","+","|","<",">","?","/",";",":","[","]","{","}","'","\\","-","_");
	for(var i=0;i<symbol.length;i++) {
		if (obj.value.indexOf(symbol[i])>=0) {
			alert("이름에는 특수문자를 입력하실수 없습니다.");
			obj.value = "";
			obj.focus();
			return false;
		}
	}
	return true;
}

//-----------------------------------------------------------------------------
// 주민번호 체크 XXXXXX-XXXXXXX 형태로 체크
// @return : true(맞는 형식) | false(잘못된 형식)
//-----------------------------------------------------------------------------
String.prototype.juminChk = function() {
	var num = this.trim().onlyNum();
	if(num.length == 13) {
		num = num.substring(0, 6) + "-" + num.substring(6, 13); 
	} else {
		return false;
	}
	num = num.match(/^([0-9]{6})-?([0-9]{7})$/);
	if(!num) return false;
	var num1 = RegExp.$1;
	var num2 = RegExp.$2;
	if(!num2.substring(0, 1).match(/^[1-4]{1}$/)) return false;
	num = num1 + num2;
	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (i=0; i<12; i++) {
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return ((11 - mod) % 10 == last) ? true : false;
}

//-----------------------------------------------------------------------------
// 사업자번호 체크 XXX-XX-XXXXX 형태로 체크
// @return : true(맞는 형식) | false(잘못된 형식)
//-----------------------------------------------------------------------------
String.prototype.biznumChk = function() {
	var num = this.trim().onlyNum();
	if(num.length == 10) {
		num = num.substring(0, 3) + "-" + num.substring(3, 5) + "-" + num.substring(5, 10);
	} else {
		return false;
	}
	/*
	num = num.match(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);
	if(!num) return false;
	num = RegExp.$1 + RegExp.$2 + RegExp.$3;
	var cVal = 0;
	for (var i=0; i<8; i++) {
		var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : ( _tmp == 1 ) ? 3 : 7);
		cVal += (parseFloat(num.substring(i,i+1)) * cKeyNum) % 10; 
	}
	var li_temp = parseFloat(num.substring(i,i+1)) * 5 + '0';
	cVal += parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2));
	return (parseInt(num.substring(9,10)) == 10 - (cVal % 10)%10) ? true : false;
	*/
	
	var checkID = new Array(1,3,7,1,3,7,1,3,5,1);
	var i , Sum=0, c2, rem ;
	
	num = num.replace(/-/gi,'');
	for (i=0;i<=7;i++) {
		Sum +=checkID[i] * num.charAt(i);
	}
	c2 = "0"+(checkID[8]*num.charAt(8));	
	c2 = c2.substring(c2.length-2,c2.length);
	
	Sum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
	
	rem = (10-(Sum % 10)) % 10 ;
	
	if (Math.floor(num.charAt(9)) != rem) {
		return false;
		}
	else { return true; }
	
	
}

// 우편번호 검색
var postcode_Win = null;
function searchPostCode(flag) {
	if (postcode_Win != null && postcode_Win.closed) postcode_Win.close();
	var url = "/lib/postcode/postCode.asp?flag="+flag;
	if(flag=="") { alret("Form Name을 전달해 주세요!"); }
	else {
		postcode_Win=window.open(url,'postcode_Win','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizeable=yes,width=600,height=400,top=10,left=400');
	}
}	

// 전화번호 체크(숫자형 체크는 폼에서 한다)
function phoneChk(obj1, obj2, obj3) {
	if ((obj1.value.length < 2)) {
		alert("전화번호를 정확하게 입력해주세요.");
		obj1.focus();
		return false;
	}
	if ((obj2.value.length < 3)) {
		alert("전화번호를 정확하게 입력해주세요.");
		obj2.focus();
		return false;
	}
	if ((obj3.value.length < 4)) {
		alert("전화번호를 정확하게 입력해주세요.");
		obj3.focus();
		return false;
	}
	
	return true;
}


/*****  찬일  *****/

/*****  승규  *****/

function excel(u) {
	document.myForm.action = u;
	document.myForm.submit();
}	


//* input box - calendar function call  *//
function InClick_Calendar(elt)
{
	if(Check_Calendar(elt))
	{
	Calendar_Display(elt);
	}
}

//* input box - calendar function call , 현재 날짜 설정 *//
function InClick_Calendar2(elt,dateValue)
{
	if(Check_Calendar(elt))
	{
	Calendar_Display(elt,dateValue);
	}
}

// iframe의 높이를 내용에 따라 자동 조절
function resizeWorkspace(workspaceFrame)
{
	var innerHeight = workspaceFrame.contentWindow.document.body.scrollHeight;
	 document.getElementById(workspaceFrame.name).height = innerHeight + 20;
}

// 다음 입력항목으로 자동 이동
function nextInput(ti,cnt,ni) {
	if (ti.value.length==cnt) {
		ni.focus();
	}
}

// 입력된 내용을 특정 입력항목에 자동 복사
function copyData(source, target) {
	target.value = source.value;
}


function DateAdd(objDate, strInterval, intIncrement) {
	if (typeof (objDate) == "string") {
			objDate = new Date(objDate.substr(0,4), objDate.substr(5,2), objDate.substr(8,2));
			if (isNaN(objDate)) {
					throw ("DateAdd: Date is not a valid date");
			}
	}
	else if (typeof (objDate) != "object" || objDate.constructor.toString().indexOf("Date()") == -1) {
			throw ("DateAdd: First parameter must be a date object");
	}
	if (
			strInterval != "M"
			&& strInterval != "D"
			&& strInterval != "Y"
			&& strInterval != "h"
			&& strInterval != "m"
			&& strInterval != "uM"
			&& strInterval != "uD"
			&& strInterval != "uY"
			&& strInterval != "uh"
			&& strInterval != "um"
			&& strInterval != "us"
			) {
			throw ("DateAdd: Second parameter must be M, D, Y, h, m, uM, uD, uY, uh, um or us");
	}
	if (typeof (intIncrement) != "number") {
			throw ("DateAdd: Third parameter must be a number");
	}
	switch (strInterval) {
		case "M":
				//alert(objDate +", "+ objDate.getMonth());
				objDate.setMonth(parseInt(objDate.getMonth()) + parseInt(intIncrement));
				break;
		case "D":
				objDate.setDate(parseInt(objDate.getDate()) + parseInt(intIncrement));
				break;
		case "Y":
				objDate.setYear(parseInt(objDate.getYear()) + parseInt(intIncrement));
				break;
		case "h":
				objDate.setHours(parseInt(objDate.getHours()) + parseInt(intIncrement));
				break;
		case "m":
				objDate.setMinutes(parseInt(objDate.getMinutes()) + parseInt(intIncrement));
				break;
		case "s":
				objDate.setSeconds(parseInt(objDate.getSeconds()) + parseInt(intIncrement));
				break;
		case "uM":
				objDate.setUTCMonth(parseInt(objDate.getUTCMonth()) + parseInt(intIncrement));
				break;
		case "uD":
				objDate.setUTCDate(parseInt(objDate.getUTCDate()) + parseInt(intIncrement));
				break;
		case "uY":
				objDate.setUTCFullYear(parseInt(objDate.getUTCFullYear()) + parseInt(intIncrement));
				break;
		case "uh":
				objDate.setUTCHours(parseInt(objDate.getUTCHours()) + parseInt(intIncrement));
				break;
		case "um":
				objDate.setUTCMinutes(parseInt(objDate.getUTCMinutes()) + parseInt(intIncrement));
				break;
		case "us":
				objDate.setUTCSeconds(parseInt(objDate.getUTCSeconds()) + parseInt(intIncrement));
				break;
	}
	//alert(objDate.toGMTString() +" : "+ objDate.getYear() +"-"+ addZero(parseInt(objDate.getMonth())+1) +"-"+ addZero(objDate.getDate()) );
	return objDate;
}


// Ajax xmlhttp 선언 ---------------------
var xmlhttp = false;
if (window.XMLHttpRequest) {
	xmlhttp = new XMLHttpRequest();
	//xmlhttp.overrideMimeType('text/xml');
} else if (window.ActiveXObject) {
	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
}

/*****  황  *****/


function chkNum(objNm){
	var obj = document.getElementsByName(objNm)[0];
	var ptrn = /^[0-9]+$/;
	var key = "27,9,20,16,17,25,18,21,91,92,32,8,13,93,45,46,36,35,33,34,145,19,37,40,39,38,144";
	if (key.indexOf(event.keyCode) < 0){
		if(!ptrn.test(obj.value)){
		alert("숫자만 입력하실 수 있습니다.");
		obj.value = '';
		obj.focus();
		return;
		}	
	}
}
function chkNum2(objNm){		
	var obj = document.getElementsByName(objNm)[0];		
	var key = "";
	key = key + ",48,49,50,51,52,53,54,55,96,97,98,99,100,101,102,103,104,105"; //숫자		
	key = key + ",27,9,20,16,17,25,18,21,91,92,32,8,13,93,45,46,36,35,33,34,145,19,37,40,39,38,144"; //특수 문자
	key = key + ",188"; //콤마
	if (key.indexOf(event.keyCode) < 0){			
		alert("숫자만 입력하실 수 있습니다.");
		obj.value = '';
		obj.focus();
		return;
	}
}


/**
 * 숫자에서 자리구분 콤마(,)를 제거한다.
 */
function noComma(str){
	var txt = str + ""
	txt = txt.replace(/\,/g,"");	
	return txt;
}

/**
 * 숫자에 자리구분 콤마(,)를 표시해서 리턴한다.
 */
function comma(num)
{
	var txt = noComma(num)
	var len = txt.length;
	var gb = 0;
	var commaCnt = Math.floor((txt.length -1) / 3); //콤마 수
	var newTxt = txt;

	if(len > 3){ 
		// 처음 콤마 앞
		if(len % 3 == 1) gb = 1;
		else if(len % 3 == 2) gb = 2;
		else if(len % 3 == 0) gb = 3;

		// 두 번째부터 끝까지 콤마
		for(i=0; i <= commaCnt; i++){
			if( i == 0 ){
				newTxt = txt.substr(0,gb);
			}else if(i == 1){
				newTxt = newTxt + txt.substr(gb,3);
			}else{
				gb = gb + 3
				newTxt = newTxt + txt.substr(gb,3);    
			}
			if(i!=commaCnt)
				newTxt = newTxt + ",";
		}		
	}
	return newTxt;
}
