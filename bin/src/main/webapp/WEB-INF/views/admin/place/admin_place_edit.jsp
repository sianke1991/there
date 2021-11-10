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
        var latLngValue = {		// json파일에 있는 장소명 찾아서 위도,경도 변경사항 갱신하기
            lat: lat,
            lng: lng
        }
        console.log(lat, lng);
	});
	
	// 현재 플레이스의 카테고리 radio 체크하기
	$.each($('input[name="place_category"]'), function(idx, ele){
		if($(this).val() == '${plbean.place_category}') {
			$(this).attr('checked', true);
		}
	});
	
	
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

<section class="admin_contents" id="form_link04" style="">
	<div class="container col-md-12">
		<div class="page-header">
        	<h2>플레이스 수정 <small>Place Edit</small></h2>
        </div>

        <div class="panel panel-default">
        	<div class="panel-heading">
            	등록된 플레이스의 정보를 수정할 수 있습니다.
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/admin/place/${place_idx}" method="POST" class="form-horizontal" id="placeAdd">
            <input type="hidden" name="_method" value="put"/>
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
                      <input type="text" id="placeName" class="form-control" name="place_name" value="${plbean.place_name }" pattern=".{1,50}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeAddr" class="col-sm-2 control-label">주소</label>
                  <div class="col-sm-10">
                  	  <input type="text" id="placeAddr" class="form-control" name="place_addr" value="${plbean.place_addr }" pattern="[\w | \W | 가-힣  | / | - |  (  |  ) | , | ]{1,128}" required/>
                  	  <div id="map" style="width:100%;height:350px; margin-top: 5px;"></div>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeOpentime" class="col-sm-2 control-label">영업 시작 시간</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeOpentime" class="form-control" name="place_opentime" value="${plbean.place_opentime }"  pattern="[\d]{1,2}(:|시)\s?[\d]{1,2}분?" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeEndtime" class="col-sm-2 control-label">영업 종료 시간</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeEndtime" class="form-control" name="place_endtime" value="${plbean.place_endtime }"   pattern="[\d]{1,2}(:|시)\s?[\d]{1,2}분?" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeTel" class="col-sm-2 control-label">전화 번호</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeTel" class="form-control" name="place_tel" value="${plbean.place_tel }" pattern=".{1,16}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeUrl" class="col-sm-2 control-label">대표 사이트</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeUrl" class="form-control" name="place_url" value="${plbean.place_url }" pattern=".{1,128}" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeContent" class="col-sm-2 control-label">간략설명</label>
                  <div class="col-sm-10">
                      <textarea id="placeContent" class="form-control" name="place_content" pattern=".{1,65535}" required>${plbean.place_content }</textarea>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeHashtag" class="col-sm-2 control-label">관련태그</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeHashtag" class="form-control" name="place_hashtag" value="${plbean.place_hashtag }" required/>
                  </div>
              </div>
              <div class="form-group">
                  <label for="placeThumb" class="col-sm-2 control-label">썸네일</label>
                  <div class="col-sm-10">
                      <input type="text" id="placeThumb" class="form-control" name="place_thumb" value="${plbean.place_thumb }" required/>
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