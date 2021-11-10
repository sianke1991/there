<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf&libraries=services"></script>
<script>
$(function(){
	var addrName, lat, lng;
	
	var mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    }; 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var geocoder = new kakao.maps.services.Geocoder();
	
	$('#placeAddr').change(function(){
        addrName = $('#placeAddr').val();
        console.log(addrName);

        geocoder.addressSearch(addrName, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            lat = result[0].y;
	            lng = result[0].x;
	    
	            var coords = new kakao.maps.LatLng(lat, lng);
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });
	            
	            var infowindow = new kakao.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">이 위치가 맞나요?</div>'
	            });
	            
	            infowindow.open(map, marker);
	            map.setCenter(coords);
	            
	            $('#placeLat').val(lat);
	            $('#placeLng').val(lng);
	            //console.log($('#placeLat').val(), $('#placeLng').val());
	        } 
	    });

        

	});
	
	$('#placeAdd').submit(function(e){
        //e.preventDefault();
        var latLngValue = {		// 위도, 경도, 장소명 json파일로 저장하기
            lat: lat,
            lng: lng
        }
        console.log(lat, lng);

	});
	
	
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

<section class="admin_contents" id="form_link04" style="">
	<div class="container col-md-12">
		<div class="page-header">
        	<h2>플레이스 등록 <small>Place Add</small></h2>
        </div>

        <div class="panel panel-default">
        	<div class="panel-heading">
            	새로운 플레이스를 등록할 수 있습니다.
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/admin/place" method="POST" class="form-horizontal" id="placeAdd">
        	<input type="hidden" name="place_latitude" id="placeLat" />
        	<input type="hidden" name="place_longitude" id="placeLng" />
            <div class="form-group">
                  <label class="col-sm-2 control-label">카테고리</label>
                  <div class="radio col-sm-10">
                      <label for="cate1">
                      	<input type="radio" value="맛집" id="cate1" name="place_category" />맛집
                      </label>
                      <label for="cate2">
                      	<input type="radio" value="카페" id="cate2" name="place_category" />카페
                      </label>
                      <label for="cate3">
                      	<input type="radio" value="놀거리" id="cate3" name="place_category" />놀거리
                      </label>
                      <label for="cate4">
                      	<input type="radio" value="술집" id="cate4" name="place_category" />술집
                      </label>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeName" class="col-sm-2 control-label">플레이스명</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeName" class="form-control" name="place_name" placeholder="플레이스의 이름을 입력해주세요 (50자 이내)" pattern=".{1,50}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeAddr" class="col-sm-2 control-label">주소</label>
                  <div class="col-sm-10">
                  	  <input type="text" id="placeAddr" class="form-control" name="place_addr" placeholder="주소를 입력해주세요 (128자 이내)" pattern="[\w | \W | 가-힣  | / | - |  (  |  ) | , | ]{1,128}" required/>
                  	  <div id="map" style="width:100%;height:350px; margin-top: 5px;"></div>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeOpentime" class="col-sm-2 control-label">영업 시작 시간</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeOpentime" class="form-control" name="place_opentime" placeholder="영업 시작 시간을 입력해주세요 (ex. 00시OO분)"  pattern="[\d]{1,2}(:|시)\s?[\d]{1,2}분?" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeEndtime" class="col-sm-2 control-label">영업 종료 시간</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeEndtime" class="form-control" name="place_endtime" placeholder="영업 종료 시간을 입력해주세요 (ex. 00시OO분)"  pattern="[\d]{1,2}(:|시)\s?[\d]{1,2}분?" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeTel" class="col-sm-2 control-label">전화 번호</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeTel" class="form-control" name="place_tel" placeholder="플레이스의 전화번호를 입력해주세요 (16자 이내)" pattern=".{1,16}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeUrl" class="col-sm-2 control-label">대표 사이트</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeUrl" class="form-control" name="place_url" placeholder="대표 사이트를 입력해주세요 (ex. 홈페이지, 인스타그램, 블로그 등)" pattern=".{1,128}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeContent" class="col-sm-2 control-label">간략설명</label>
                  <div class="col-sm-10">
                      <textarea id="placeContent" class="form-control" name="place_content" pattern=".{1,65535}" placeholder="이 플레이스에 대한 간단한 설명을 작성해주세요 (1000자 이내)" required></textarea>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeHashtag" class="col-sm-2 control-label">관련태그</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeHashtag" class="form-control" name="place_hashtag" placeholder="이 플레이스와 관련된 태그를 입력해주세요.(최대 5개 / 쉼표(,)로 구분)" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeThumb" class="col-sm-2 control-label">썸네일</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeThumb" class="form-control" name="place_thumb" placeholder="파일첨부양식으로 바꾸기" required/>
                  </div>
              </div>

			<div class="btn-box">
			    <a href="${pageContext.request.contextPath}/admin/place" class="btn btn-default btn-margin">목록</a>
			    <button type="reset" class="btn btn-default btn- margin">초기화</button>
				<button type="submit" class="btn btn-primary btn-margin">입력</button>
			</div>
          </form>
  
	</div> 
</section>
</body>
</html>