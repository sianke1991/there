<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/include.jspf" %>
</head>
<body>
<%@ include file="template/header.jspf" %>

<main class="main-page">
    <div class="content-wrap">
        <div class="weekly-magazine-sect">
            <div class="container">
                <h2 class="sect-tit mb20">🍂 이번 주 추천 매거진 🍂</h2>
                <p class="wm-tag mb40"><span>#가을피크닉</span><span>#선선한바람</span></p>
            </div>
            <div class="swiper magazine-slider"> <!-- 관리자에서 매거진 게시판에 등록한 게시글의 썸네일, 제목, #태그가 슬라이드로 노출 (최근게시글 10개) -->
                <div class="swiper-wrapper">
                    <div class="swiper-slide"> 
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/wm_img01.jpg);"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>떠나자 단풍 구경! 🍁</strong> <!-- 게시글 제목 -->
                                <p><span>#출근길 코가 시큰해지는 계절</span></p> <!-- 게시글 관련태그 => 게시물 등록시 작성필요 -->
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/wm_img02.jpg);"></div>
                            <div class="thumb-desc">
                                <strong>단풍 명소 화담숲 정보 총정리 📚</strong>
                                <p><span>#여행정보</span><span>#단풍명소</span></p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/wm_img03.jpg);"></div>
                            <div class="thumb-desc">
                                <strong>여 미국이가😲 용산공원 데이트 코스</strong>
                                <p><span>#데이트코스</span><span>#용산</span></p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/wm_img04.jpg);"></div>
                            <div class="thumb-desc">
                                <strong>서울로 떠나는 세계 미식여행 🍽️</strong>
                                <p><span>#서울 미식주간</span></p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="slide-next">👉</div>
                <div class="slide-prev">👈</div>
            </div>
        </div>
        <!-- // weekly-magazine-sect  -->


        <div class="place-cate-sect">
            <div class="container">
                <div class="tac">
                    <h2 class="sect-tit tac mb80">카테고리별 추천 PLACE 👀</h2>
                    <ul class="cate-btns mb100">
                        <li><a href=""><span>맛집</span></a></li>
                        <li><a href=""><span>카페</span></a></li>
                        <li><a href=""><span>놀거리</span></a></li>
                        <li><a href=""><span>술집</span></a></li>
                    </ul>
                    <a class="abtn abtn-mint big" href="#">더보기</a>
                </div>
            </div>
        </div>
        <!-- // place-cate-sect -->


        <div class="place-location-sect">
            <div class="container">
                <h2 class="sect-tit mb40">지역별 📍 추천 PLACE</h2>
                <div class="map-btns tac mb20">
                    <button class="abtn abtn-gray">내 주변 보기</button>
                    <a class="abtn abtn-mint" href="">자세히 보기</a>
                </div>
                <div id="map"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf&libraries=clusterer"></script>
                <script>
                    var map = new kakao.maps.Map(document.getElementById('map'), {
                        center : new kakao.maps.LatLng(37.564079, 126.980046),
                        level : 7
                    });
                    var clusterer = new kakao.maps.MarkerClusterer({
                        map: map,
                        averageCenter: true,
                        minLevel: 10,
                        disableClickZoom: true
                    });
    
                    $.get("/chicken.json", function(data) {
                        var markers = $(data.positions).map(function(i, position) {
                            return new kakao.maps.Marker({
                                position : new kakao.maps.LatLng(position.lat, position.lng)
                            });
                        });
                        clusterer.addMarkers(markers);
                    });

                    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
                        var level = map.getLevel()-1;
                        map.setLevel(level, {anchor: cluster.getCenter()});
                    });
                </script>
            </div>
        </div>
        <!-- // place-location-sect -->


        <div class="top20-place-sect">
            <div class="container">
                <h2 class="sect-tit mb40">❤️ 좋아요 많은 장소 TOP 20</h2>
            </div>
            <div class="swiper place-slider">   <!-- 관리자에서 등록한 장소 중 좋아요 눌린 수가 많은 상위 20개 장소를 썸네일, 장소명, #태그가 슬라이드로 노출 -->
                <div class="swiper-wrapper">
                    <div class="swiper-slide"> 
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb01.jpg);"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>성수 OO카페 👫</strong>   <!-- 장소명 -->
                                <p><span>#성수 카페</span><span>#야간명소</span></p>  <!-- 장소 관련태그 => 게시물 등록시 작성필요 -->
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide"> 
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb02.jpg);"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>🌄OO 마운틴 카페</strong>
                                <p><span>#마운틴뷰 카페</span><span>#힐링카페</span></p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide"> 
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb03.jpg);"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>OO오션 식당💙</strong>
                                <p><span>#서울근교</span><span>#맛집</span></p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide"> 
                        <a href="#">
                            <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb04.jpg);"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>잠실 노천 영화상영장 🎬</strong>
                                <p><span>#가을밤 노천 영화상영제</span><span>#무비</span></p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="slide-next">👉</div>
                <div class="slide-prev">👈</div>
            </div>
        </div>
        <!-- // weekly-magazine-sect  -->

    </div>
    <!-- // content-wrap  -->

  
</main>
<!-- // main -->

    
<%@ include file="template/footer.jspf" %>
</body>
</html>