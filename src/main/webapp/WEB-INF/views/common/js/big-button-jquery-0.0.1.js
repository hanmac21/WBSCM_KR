/**
 * targetUrl?param 의 호출 결과를 outerTag에 대체한다.
 * @param targetUrl
 * @param params
 * @param outerTag
 */
function BB_ajaxHtmlInsert(targetUrl, params, outerTag) {
	$.ajax({
		type:"POST",
		url:targetUrl,
		dataType:"html",
		data:params,
		success:function(msg){
			$(outerTag).html(msg);
			//init();
		}
	});
}

var popContent;
/**
 * 팝업 레이어에 제목과 컨텐츠를 담고 마스크레이어와 함께 띄운다.
 * @param popupTitle
 * @param popupContents
 */
function BB_popupLayer(popupTitle, popupContents) {
	BB_makePopup(popupTitle, popupContents);
	BB_openPopupLayer("");
	//BB_disableUnderModal();
}
function BB_customLayer(popupTitle, popupContents, type) {
	BB_openPopupLayer(type);
	BB_makePopup(popupTitle, popupContents);
	//BB_disableUnderModal();
}
/**
 * 팝업 레이어에 제목을 설정하고 컨텐츠를 담는다.
 * @param popupTitle
 * @param popupContents
 */
function BB_makePopup(popupTitle, popupContents){
	popContent = popupContents;
	$("#windowTitle").html(popupTitle);
	$("#windowContents").html($(popupContents).html());
	$(popupContents).html("");
}

/**
 * 팝업 레이어와 마스크를 오픈한다.
 */
var popup;
var popupType;
var popupWidth;
function BB_openPopupLayer(type){
	//팝업을 화면 가운데 뜨도록 한다.
	var $layerPopupObj = $("#window");
	var left;
	var top;
	popup = $layerPopupObj;
	popupType = type;
	if (type=="full") {
		left = 0;
		var top = 79;
		$layerPopupObj.css({'left':left,'top':top, 'position':'absolute', 'width':$(window).width()});
		// 직각 모서리
		$("#window").css( { 
			"border-radius":0, "-moz-border-radius":0, "-webkit-border-radius":0,
	        "box-shadow":"", "-webkit-box-shadow":"", "-moz-box-shadow":"" 
	    }); 
		$("#window #windowHeader").css( { "border-top-left-radius":0, "-moz-border-radius-topleft":0, "-webkit-border-top-left-radius":0, 
			"border-top-right-radius":0, "-moz-border-radius-topright":0, "-webkit-border-top-right-radius":0
		});
	} else if (type=="fixed") {
		var width = 800;
		popupWidth = width;
		left = ( $(window).scrollLeft() + ($(window).width() - width) / 2 );
		var top = 100;
		$layerPopupObj.css({'left':left,'top':top, 'position':'absolute', 'width':width});
		// 둥근 모서리
		$("#window").css( { 
			"border-radius":7, "-moz-border-radius":7, "-webkit-border-radius":7,
	        "box-shadow":"0 0 4 rgba(0,0,0,0.7)", "-webkit-box-shadow":"0 0 4 rgba(0,0,0,0.7)", "-moz-box-shadow":"0 0 4 rgba(0,0,0,0.7)" 
	    }); 
		$("#window #windowHeader").css( { "border-top-left-radius":5, "-moz-border-radius-topleft":7, "-webkit-border-top-left-radius":7, 
			"border-top-right-radius":7, "-moz-border-radius-topright":7, "-webkit-border-top-right-radius":7
		});
	} else {
		left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
		top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
		popupWidth = $layerPopupObj.width();
		$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
		// 둥근 모서리
		$("#window").css( { 
			"border-radius":7, "-moz-border-radius":7, "-webkit-border-radius":7,
	        "box-shadow":"0 0 4 rgba(0,0,0,0.7)", "-webkit-box-shadow":"0 0 4 rgba(0,0,0,0.7)", "-moz-box-shadow":"0 0 4 rgba(0,0,0,0.7)" 
	    }); 
		$("#window #windowHeader").css( { "border-top-left-radius":5, "-moz-border-radius-topleft":7, "-webkit-border-top-left-radius":7, 
			"border-top-right-radius":7, "-moz-border-radius-topright":7, "-webkit-border-top-right-radius":7
		});
	}
	$('body').css('position','relative').append($layerPopupObj);

	setMaskFull();
	
	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	//$(element).fadeIn(1000);
	$("#window-mask").fadeTo("fast",0.5);
	
	//팝업을 띄운다.
	$("#window").show();
}

function setMaskFull() {
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	//$("#window-mask").css({'width':maskWidth,'height':maskHeight});
	$("#window-mask").css({'width':maskWidth, 'height':maskHeight});
}
function popupWindowCenter() {
	if (popupType!="full") {
		left = ( $(window).scrollLeft() + ($(window).width() - popupWidth) / 2 );
		//alert(left);
		popup.css({'left':left});
	}
}

function popupCenter() {
	setMaskFull();
	popupWindowCenter();
}

window.onresize = popupCenter;

/**
 * 팝업 레이어와 마스크를 닫는다.
 * @param popupElement
 * @param maskElement
 */
function BB_closePopupLayer(){
	$("#window, #window-mask").hide();
	$(popContent).html($("#windowContents").html());
	$("#windowContents").html("");
	BB_enableUnderModal();
}

function BB_disableUnderModal() {
	$("#underModal").css("display","none");
}
function BB_enableUnderModal() {
	$("#underModal").css("display","block");
}

