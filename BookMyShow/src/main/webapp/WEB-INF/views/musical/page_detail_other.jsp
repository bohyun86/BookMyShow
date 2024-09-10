<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <!-- 메뉴영역, js/ajaxtabs.css -->
    <ul id="maintab" class="shadetabs FixedTopMenu" style="border-radius:10px 10px 0 0;">
      <li id="tab_01_notice" class="selected" onclick="loadKakaoMap();"><a class="tabLink" href="#default" rel="ajaxcontentarea"><span>안내</span></a></li>
      <li class=""><a onclick="loadTab(1, this)"><span>후기<span style="letter-spacing:-1px;">(242)</span></span></a></li>
      <li class=""><a onclick="loadTab(2, this)"><span>Q&amp;A<span style="letter-spacing:-1px;">(3)</span></span></a></li>
      <li class=""><a onclick="loadTab(3, this)"><span>장소</span></a></li>
      <li class=""><a onclick="loadTab(4, this)"><span>환불규정</span></a></li>
    </ul>



    <!---------------------- 탭 영역 시작 ----------------------->
    <div id="ajaxcontentarea" class="contentstyle1" style="border-radius:0 0 10px 10px">
      <div class="main_tab_wrap">

        <!-- 클래스 안내 배너 -->
        <div style="display:none;; width:700px; height:95px; margin-bottom:20px;">
          <img src="/img/bnr_class_noti.png" style="width:700px; border-radius:10px;" alt="예매전 주의사항 - 클래스">
        </div>

        <div style="margin-top:10px;">
          <div class="viewpage_noti">예매정보</div>
          <div class="viewpage_text radius_box">
            <p>· 진행기간: OPEN RUN</p>
            <p>· 이용등급: 만 7세 이상</p>
            <p>· 이용시간: 약 100분</p>
          </div>
        </div>

        <div style="margin-top:25px; display:none;">
          <div class="viewpage_noti">기획사 공지사항</div>
          <div class="viewpage_text radius_box"></div>
        </div>

        <div style="margin-top:25px;">
          <div class="viewpage_noti">이용정보</div>
          <div class="viewpage_text radius_box"><div class="info_perform">
  <div class="flex" alt="마감시간">
    <div class="ico"></div>
    <div>공연 시작 1시간 전 예매 마감</div>
  </div>
  <div class="flex" alt="티켓 배부">
    <div class="ico"></div>
    <div>
      <div><span class="red">공연 시작 30분 전부터</span> 공연장 매표소에서 티켓 배부</div>
      <div class="sub">문자/예매내역 제시 및 본인확인 후 수령</div>
    </div>
  </div>
  <div class="flex" alt="입장시간">
    <div class="ico"></div>
    <div><span class="red">공연 시작 10분 전부터</span> 공연장 입장</div>
  </div>
  <div class="flex" alt="좌석배정">
    <div class="ico"></div>
    <div>
      <div><span class="red">비지정석</span></div>
      <div class="sub">타예매처 지정석 제외 후 매표소 선착순 좌석 배정</div>
      <div class="sub">각각 예매하더라도 함께 발권하면 연석 배정 가능</div>
    </div>
  </div>
</div></div>
        </div>


        <!-- 상세이미지 -->
       <%--  <div class="info_detail_poster" alt="상세">
          <div class="info_detail_gradient"></div>
          <div class="info_detail_btn" onclick="showMoreDetailImage()">펼쳐보기
            <img src="${pageContext.request.contextPath}/resources/images/musical_detail/icon_down.png" style="width:13px; vertical-align:2px;padding-left:10px;">
          </div>
          <script>
            function showMoreDetailImage() {
              document.querySelector('.info_detail_btn').remove();
              document.querySelector('.info_detail_gradient').remove();
              document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
              let xhr = new XMLHttpRequest();
              xhr.open('GET', `./index.php?number=5229&mode=extend_detail_info`, true);
              xhr.send();
              xhr.onload = () => {
                  if (xhr.status === 200) {
                    document.querySelector('.main_img').innerHTML = xhr.response;
                    document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
                  }
                }
              }
          </script>
        </div>
        <div class="main_img"></div> --%>


        <div style="margin-top:25px;">
          <div class="viewpage_noti">유의사항</div>
          <div class="viewpage_text radius_box"><p>· 공연 시작 후 발권 또는 입장 불가(지연입장 불가)</p>
<p>· 지각으로 인해 관람하지 못할 시 환불/변경 불가</p>
<p>· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가</p>
<p>· 음식물 반입 금지. 공연 중 사진/동영상 촬영 금지</p>
<p class="txt_red">· 관람 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.</p></div>
        </div>


      </div>
    </div>

        <!--------- 장소안내 --------->
        <div style="margin-top:25px;">
          <div class="viewpage_noti">장소안내</div>
          <div class="viewpage_text radius_box" style="border-radius: 10px 10px 0 0;">
            <p>· 장소: 대학로 무하아트센터&nbsp;/&nbsp;총 164석</p>
            <p>· 주소: 서울특별시 종로구 이화장길 72 </p>
            <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
          </div>
          <div align="center" style="margin-top:10px;">
            <div style="z-index:-1;" id="daum_map">
              <div id="map" style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute; left: 0px; top: 0px;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4008/1798.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -181px; top: 302px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4008/1799.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 75px; top: 302px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4008/1800.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 331px; top: 302px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4008/1801.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 587px; top: 302px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4009/1798.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -181px; top: 46px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4009/1799.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 75px; top: 46px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4009/1800.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 331px; top: 46px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4009/1801.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 587px; top: 46px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4010/1798.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -181px; top: -210px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4010/1799.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 75px; top: -210px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4010/1800.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 331px; top: -210px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v26_xnfzm/2/4010/1801.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 587px; top: -210px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1400px; top: -700px; width: 3500px; height: 1750px;" viewBox="0 0 3500 1750"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 350px; top: 175px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/mapjsapi/images/marker.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;"><img src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif" alt="" role="presentation" draggable="false" usemap="#daum.maps.Marker.Area:5" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;"><map id="daum.maps.Marker.Area:5" name="daum.maps.Marker.Area:5"><area href="javascript:void(0)" alt="" role="presentation" shape="poly" coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 56px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">30m</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" style="float: left; width: 32px; height: 10px;"><img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 맵으로 이동(새창열림)" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"><div style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 665px; top: 3px;"><button draggable="false" title="확대" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px 0px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button><div style="float: left; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png&quot;) repeat; padding: 7px 0px; transition: height, margin 0.1s;"><div style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s; margin: 2px 0px; display: block; width: 32px; height: 104px;"><div style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;"><div style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -50px -127px / 116px 264px;"></div><div style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -100px / 116px 264px;"></div></div><div style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 8px;"></div><div style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -80px / 116px 264px; left: 50%; transition: top 0.1s; top: 8px;"></div></div></div><button draggable="false" title="축소" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -32px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button><div style="display: none; position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px;"><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -80px / 116px 264px; left: 0px; top: 8px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -100px / 116px 264px; left: 0px; top: 32px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -120px / 116px 264px; left: 0px; top: 64px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -140px / 116px 264px; left: 0px; top: 80px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -160px / 116px 264px; left: 0px; top: 96px;"></div></div></div></div></div>
            </div>
          </div>
        </div>

        <!--------- 판매정보 --------->
        <div style="margin-top:25px; margin-bottom:25px;">
          <div class="viewpage_noti">판매정보</div>

          <div class="viewpage_text border_box">
            <div class="viewpage_flex">
              <div>주최/주관</div>
              <div>극단 무하</div>
            </div>
            <div class="viewpage_flex" style="">
              <div>문의전화</div>
              <div>📞 <a href="TEL:1644-3196">1644-3196</a></div>
            </div>
            <div class="viewpage_flex" style="display:none;">
              <div>문의링크</div>
              <div>🔗 <a href="" target="_blank" style="text-decoration:underline;"></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불규정</div>
              <div><a href="#tab_view" onclick="loadTab(4, this)"><span>환불규정 바로가기</span></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불방법</div>
              <div>마이티켓 &gt; 예매내역에서 직접 취소</div>
            </div>

          </div>
        </div>

</body>
</html>