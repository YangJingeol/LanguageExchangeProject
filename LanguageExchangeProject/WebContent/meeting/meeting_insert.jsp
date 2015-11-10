<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="meeting/css/insert.css" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- Smart Editor -->
<script type="text/javascript" src="meeting/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- Smart Editor -->
<script type="text/javascript">
//textArea에 이미지 첨부
$(function(){
   var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "content",
       sSkinURI: "meeting/se2/SmartEditor2Skin.html",
       fCreator: "createSEditor2"
   });
   
   // 다음 단계
   $('.next.button').click(function(){
      
      oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
      var category1=$('.category1').val();
      if(category1==0)
      {
         $('.category1').focus();
         $('#selectSpan').text("* 언어를 선택하세요");
         return;
      }
      $('#selectSpan').text("");
      
      var category2=$('.category2').val();
      if(category2==0)
      {
         $('.category2').focus();
         $('#selectSpan').text("* 언어를 선택하세요");
         return;
      }
      $('#selectSpan').text("");
      
      var lang1num=$('.lang1num').val();
      if(lang1num==0)
      {
         $('.lang1num').focus();
         $('#selectSpan').text("* 인원을 선택하세요");
         return;
      }
      $('#selectSpan').text("");
      
      var lang2num=$('.lang2num').val();
      if(lang2num==0)
      {
         $('.lang2num').focus();
         $('#selectSpan').text("* 인원을 선택하세요");
         return;
      }
      $('#selectSpan').text("");
      
      var title=$('#title').val();
      if(title=="")
      {
         $('#title').focus();
         $('#titleSpan').text("* 제목을 입력하세요");
         return;
      }
      $('#titleSpan').text("");
      
      var subcontent=$('#abstract').val();
      if(subcontent=="")
      {
         $('#abstract').focus();
         $('#subTitleSpan').text("* 요약내용을 입력하세요");
         return;
      }
      $('#subTitleSpan').text("");
      
      var content=$('#content').val();
      if(content=="<p>&nbsp;</p>")
      {
         $('#content').focus();
         $('#contentSpan').text("* 상세내용을 입력하세요");
         return;
      }
      $('#contentSpan').text("");
      
      $('.roundBox.firstStep').hide();
      $('.roundBox.secondStep').show();
   });
   
   // 이전 버튼
   $('.prev.button').click(function(){
      $('.roundBox.firstStep').show();
      $('.roundBox.secondStep').hide();
   });
   
   // 작성 완료
   $('.complete.button').click(function(){
      
      var sdate1=$('#startEventDate1').val();
      if(sdate1=="")
      {
         $('#startEventDate1').focus();
         $('#dateSpan1').text("* 시작 날짜를 선택하세요");
         return;
      }
      $('#dateSpan1').text("");
      
      var edate1=$('#endEventDate1').val();
      if(edate1=="")
      {
         $('#endEventDate1').focus();
         $('#dateSpan1').text("* 종료 날짜를 선택하세요");
         return;
      }
      $('#dateSpan1').text("");
      
      var sdate2=$('#startEventDate2').val();
      if(sdate2=="")
      {
         $('#startEventDate2').focus();
         $('#dateSpan2').text("* 시작 날짜를 선택하세요");
         return;
      }
      $('#dateSpan2').text("");
      
      var edate2=$('#endEventDate2').val();
      if(edate2=="")
      {
         $('#endEventDate2').focus();
         $('#dateSpan2').text("* 종료 날짜를 선택하세요");
         return;
      }
      $('#dateSpan2').text("");
      
      var place=$('#place').val();
      if(place==0)
      {
         $('#place').focus();
         $('#locSpan').text("* 지역을 선택하세요");
         return;
      }
      $('#locSpan').text("");
      
      var loc=$('#location').val();
      if(loc=="")
      {
         $('#location').focus();
         $('#locSpan').text("* 장소를 입력하세요");
         return;
      }
      $('#locSpan').text("");
      
      $('#writeForm').submit();
   });
});
function previewImage(targetObj, previewId) {

    var preview = document.getElementById(previewId); //div id   
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {//ie일때

        targetObj.select();

        try {
            var src = document.selection.createRange().text; // get file full path 
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + previewId);

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }

            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + previewId)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + previewId;
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } else { //ie가 아닐때
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];

            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;

            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }

            var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '80px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '80px';
            
            preview.appendChild(img);

            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + previewId)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}
</script>


</head>
<body>
   <form id="writeForm" name="write_form" method="post" action="meeting_insert_ok.do" enctype="multipart/form-data">
   <div class="content">
      <h2 class="title">개설하기</h2>
      <div class="roundBox firstStep" >
         <div class="firstCore">
            <div class="title">
               <h3 class="title">step.1 모임 기본 정보입력</h3>
               <div class="menu">
                  <label class="firstStep">STEP.1</label>
                  <label class="secondStep">STEP.2</label>
               </div>
            </div>
         </div>
         <div class="core category">
            <div class="input">
               <div class="subCore category">
                  <h4 class="subTitle">언어 선택 / 제목 입력&nbsp;<span class="span" id="selectSpan"></span>
                  <span class="span" id="titleSpan"></span></h4>
                  <select class="category1" name="lang1">
                     <option value="0">교환 언어1</option>
                     <option value="한국어">한국어</option>
                     <option value="영어">영어</option>
                     <option value="중국어">중국어</option>
                     <option value="독일어">독일어</option>
                     <option value="일본어">일본어</option>
                  </select>
                  <select class="lang1num" name="lang1num">
                     <option value="0">인원</option>
                     <c:forEach var="i" begin="1" end="50">
                        <option value="${i }">${i }</option>
                     </c:forEach>
                  </select><span class="space">명</span>
                  <select class="category2" name="lang2">
                     <option value="0">교환 언어2</option>
                     <option value="한국어">한국어</option>
                     <option value="영어">영어</option>
                     <option value="중국어">중국어</option>
                     <option value="독일어">독일어</option>
                     <option value="일본어">일본어</option>
                  </select>
                  <select class="lang2num" name="lang2num">
                     <option value="0">인원</option>
                     <c:forEach var="i" begin="1" end="50">
                        <option value="${i }">${i }</option>
                     </c:forEach>
                  </select><span class="space">명</span>
                  <input id="title" type="text" name="title" maxlength="64" class="text">
                  <input type="hidden" name="email" value="${sessionScope.email }">
                  <div class="lengthMsg">
                  </div>
               </div>
            </div>
            <div class="advice">
               <p class="subAdvice">
                  <strong>언어를 선택</strong>하고 <strong>모임제목</strong>을 입력해주세요.
                  <br>
                  <br>
                  <br>
                  언어에 맞게 설정하시면 개설 후 검색이나<br>
                  언어별로 보기 편하고 쉽게 찾을 수 있습니다.<br>
                  <br>
               </p>
            </div>
         </div>
         <div class="core">
               <div class="input">
                  <div class="subCore banner noBanner">
                     <h4 class="subTitle">대표 이미지</h4>

                     <div id="previewId" class="innerBanner">
                        
                     </div>
                     
                     <input type="file" onchange="previewImage(this,'previewId')" name="upload">
                  </div>
                  <div class="subCore abstract">
                     <h4 class="subTitle">요약내용 입력&nbsp;<span class="span" id="subTitleSpan"></span></h4>
                     <textarea id="abstract" class="text" title="모임 내용을 간단히 요약하여 입력해 주세요." name="summary"></textarea>
                  </div>
               </div>
               <div class="advice">
                  <p class="subAdvice">
                     모임 특성에 맞는 이미지로 업로드 해주시고 <br>
                     대표 이미지가 없을 경우 언어나들목에서 <br>
                     추천하는 이미지를 선택해 사용할 수 있습니다. <br>
                     <br>
                     이미지 등록에 대한 안내는 <a href="/cs/faq/host#167" class="guideSite" target="_blank">FAQ</a> 를 참고하세요.
                  </p>

                  <p class="subAdvice abstract">
                     개설하는 모임의 주요내용을 참여자들이 <br>
                     쉽게 알 수 있도록 <strong>요약하여 입력</strong>해 주세요.
                  </p>
               </div>
         </div>
         <div class="core contents">
            <div class="input write">
               <div class="subCore">
                  <h4 class="subTitle">상세내용 입력&nbsp;<span class="span" id="contentSpan"></span></h4>
                  <div class="editor">
                     <textarea id="content" class="content" name="content"></textarea>
                  </div>
               </div>
            </div>
            <div class="advice">
               <p class="subAdvice focus" style="height: 341px;">
                  개설하는 모임의 <strong>상세내용을 입력</strong>하고 편집기를<br>
                  이용해 다양한 형태의 내용을 입력해 주세요.<br>
                  <br>
               </p>
            </div>
         </div>
      
         <div class="lastCore">
            <div class="action">
               <input type="button" class="next button" value="다음 단계">
            </div>
         </div>
      </div>
      <div class="roundBox secondStep" style="display: none;">
         <div class="firstCore">
            <div class="title">
               <h3 class="title">step.2 일정 / 장소 정보 입력</h3>
               <div class="menu">
                  <label class="firstStep">STEP.1</label>
                  <label class="secondStep">STEP.2</label>
               </div>
            </div>
         </div>
         <div class="core eventDate">
            <div class="input">
               <div class="subCore startEvent singleDay">
                     <h4 class="subTitle">모임기간 설정&nbsp;<span class="span" id="dateSpan1"></span></h4>
                     <div class="dateConfig">
                        <input id="startEventDate1" class="text datepicker hasDatepicker" type="date" name="meetingDate1">
                        
                        <span class="space">부터</span>
                        <input id="endEventDate1" class="text datepicker hasDatepicker" type="date" name="meetingDate2">
                        
                        <span class="space">까지</span>
                     </div>
                  </div>
                  <div class="subCore setupTime">
                     <h4 class="subTitle">참여기간 설정&nbsp;<span class="span" id="dateSpan2"></span></h4>
                     <div class="dateConfig">
                        <input id="startEventDate2" class="text datepicker hasDatepicker" type="date" name="partDate1">
                        <span class="space">부터</span>
                        <input id="endEventDate2" class="text datepicker hasDatepicker" type="date" name="partDate2">
                        <span class="space">까지</span>
                     </div>
                  </div>
            </div>
            <div class="advice">
                  <p class="subAdvice startEvent">
                     개설하려는 모임의 <strong>기간</strong>을 설정해 주세요.<br>
                     <br>
                  </p>

                  <p class="subAdvice setupTime">
                     모임에 참여하려는 참여자의 <strong>참여 신청기간</strong>을<br>
                     설정합니다.<br>
                     (참여자는 신청기간이 끝나면 해당 모임에 등록을<br>
                     할 수 없습니다.)
                  </p>
            </div>
         </div>
         <div class="core place">
               <div class="input">
                  <div class="subCore location">
                     <h4 class="subTitle">모임 지역 / 장소 설정&nbsp;<span class="span" id="locSpan"></span></h4>
                     <select id="place" name=place>
                        <option value="0">지역 선택</option>
                        <option value="서울">서울</option>
                        <option value="인천/경기">인천/경기</option>
                        <option value="부산/울산/경남">부산/울산/경남</option>
                        <option value="대전/충청">대전/충청</option>
                        <option value="광주/전라">광주/전라</option>
                        <option value="제주">제주</option>
                     </select>
                     <input class="location text" type="text" name="location" id="location" size="" maxlength="64" value="" minlen="3" required="" alias="장소를" title="정확한 장소명을 입력해 주세요.">
                  </div>
                  <div id="map" style="width:100%;height:350px;"></div>

<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d998db0ec989b933cdbbd87c230d86cf&libraries=services"></script> -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d998db0ec989b933cdbbd87c230d86cf&libraries=services,clusterer"></script>
<script type="text/javascript">
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('인천시청', placesSearchCB);
            // └> 검색어 들어갈 곳!!

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.places.length; i++) {
            displayMarker(data.places[i]);    
            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        //position: new daum.maps.LatLng(place.latitude, place.longitude) 
    });
    
   daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
        
        var message1 = latlng.getLat();
      	var message2 = latlng.getLng();
        console.log(latlng);
        /* console.log(message1);
        console.log(message2); */
        var resultDiv = document.getElementById('clickLatlng'); 
        //resultDiv.innerHTML = message;
    });

   /*  // 마커에 클릭이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
        infowindow.open(map, marker);
        
    }); */
    // 마커에 마우스오버 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
      infowindow.setContent('<div style="padding:5px;font-size:12px;">' + '으하하하하하' + '</div>');
        infowindow.open(map, marker);                           // └> 개설자가 입력할 장소명
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
    
    
}
</script>
               <!--    <div class="subCore map">
                     
                     <div class="map holder"> -->
      <!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d998db0ec989b933cdbbd87c230d86cf&libraries=services"></script>
      <div id="map" style="width:100%;height:350px;"></div>
      <script>
   // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
   var infowindow = new daum.maps.InfoWindow({zIndex:1});

   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };  

   // 지도를 생성합니다    
   var map = new daum.maps.Map(mapContainer, mapOption); 

   // 장소 검색 객체를 생성합니다
   var ps = new daum.maps.services.Places(); 

   // 키워드로 장소를 검색합니다
   ps.keywordSearch('신촌', placesSearchCB); 

   // 키워드 검색 완료 시 호출되는 콜백함수 입니다
   function placesSearchCB (status, data, pagination) {
       if (status === daum.maps.services.Status.OK) {

           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           var bounds = new daum.maps.LatLngBounds();

           for (var i=0; i<data.places.length; i++) {
               displayMarker(data.places[i]);    
               bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
           }       

           // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
           map.setBounds(bounds);
       } 
   }
   // 지도에 마커를 표시하는 함수입니다
   function displayMarker(place) {
       
       // 마커를 생성하고 지도에 표시합니다
       var marker = new daum.maps.Marker({
           map: map,
           position: new daum.maps.LatLng(place.latitude, place.longitude) 
       });

       // 마커에 클릭이벤트를 등록합니다
       daum.maps.event.addListener(marker, 'click', function() {
           // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
           infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
           infowindow.open(map, marker);
       });
   }
</script>                         -->
                        <!--    </div>
                        
                     </div> -->
                  </div>
               <div class="advice">
                  <p class="subAdvice location">
                     참여자들이 장소를 명확히 알 수 있도록<br>
                     <strong>장소명을 입력</strong>해 주세요.
                  </p>

                  <p class="subAdvice map focus">
                     모임 장소 위치를 지도에 표시하기 위해 <br>
                     <strong>지도 위치 설정</strong>을 해 주세요.<br>
                     <br>
                     설정은 지역명이나 주요명칭을 기입하여<br>
                     지정 할 수 있습니다. <br>
                     <br>
                     시, 도, 구, 동 단위로 설정할 수 있습니다.<br>
                     <br>
                     지도를 클릭하고 핀을 이동하여 위치를<br>
                     지정할 수도 있습니다.<br>
                     <br>
                     간혹 주소정보를 불러오지 못해<br>
                     지역카테고리 범주에 속하지 못할 수 있습니다.<br>
                  </p>
               </div>
            </div>
            <div class="lastCore">
               <div class="action">
                  <input type="button" class="prev button" value="이전" >
                  <input type="button" class="complete button" value="작성">
               </div>
            </div>
      </div>
   </div>
   </form>
</body>
</html>