<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커 표시하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:800px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea58e2d3bb86934cd33cbd250d4656b6"></script>
	<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
	<script>
		$(function() {
			//1. jsp가 시작하자마자 ajax를 실행해서 json을 받아와서 map을 찍을까?
			$.ajax({
				url : "map3",
				success : function(array) {
					console.log(array);
					console.log(array.length)
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.2460106, 127.0486229), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				var positions = []
				
				$(array).each(function(index, json) {
					positions.push({
				        title: json.location, 
				        latlng: new kakao.maps.LatLng(json.lat, json.lon)
				    })
				})
				// 마커를 표시할 위치와 title 객체 배열입니다 
				/* var positions = [
				    {
				        title: '카카오', 
				        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
				    },
				    {
				        title: '생태연못', 
				        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
				    },
				    {
				        title: '텃밭', 
				        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
				    },
				    {
				        title: '근린공원',
				        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
				    }
				]; */

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
				}
			
			})
		})

</script>
</body>
</html>