<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y:hidden !important">
<head>
<meta charset="UTF-8">
<title>[뮤지컬]</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/musical_detail.css">

</head>
<body>
<jsp:include page="../include/top.jsp"/>

<div style="padding-top: 20px; width:815px; margin:0 auto;">

	<div style="float: left; position:relative; width:482px; margin-right:20px; margin-top:30px; border-radius:10px;">
		<img src="${pageContext.request.contextPath}/resources/images/poster/newopen1.jpg" style="width:482px; height: 482px; border-radius:10px;">
	</div>
		<form>
		<section style="float: right; width: 307px;">
			<div id="calendar_popup" class="calendar_popup_02 choice_day"
				style="">
				<div class="popup_warp">
					<div id="datepicker"
						style="background: #fff; border-radius: 10px; min-height: 230px;"
						class="hasDatepicker">
						<div
							class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
							style="display: block;">
							<div
								class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
								<a class="ui-datepicker-prev ui-corner-all ui-state-disabled"
									title="Prev"><span
									class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><a
									class="ui-datepicker-next ui-corner-all" data-handler="next"
									data-event="click" title="Next"><span
									class="ui-icon ui-icon-circle-triangle-e">Next</span></a>
								<div class="ui-datepicker-title">
									<span class="ui-datepicker-year">2024</span>년&nbsp;<span
										class="ui-datepicker-month">09</span>
								</div>
							</div>
							<table class="ui-datepicker-calendar">
								<thead>
									<tr>
										<th scope="col" class="ui-datepicker-week-end"><span
											title="일">일</span></th>
										<th scope="col"><span title="월">월</span></th>
										<th scope="col"><span title="화">화</span></th>
										<th scope="col"><span title="수">수</span></th>
										<th scope="col"><span title="목">목</span></th>
										<th scope="col"><span title="금">금</span></th>
										<th scope="col" class="ui-datepicker-week-end"><span
											title="토">토</span></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td
											class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">1</span></td>
										<td
											class=" ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">2</span></td>
										<td
											class=" ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">3</span></td>
										<td
											class=" ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">4</span></td>
										<td
											class=" ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">5</span></td>
										<td
											class=" ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">6</span></td>
										<td
											class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">7</span></td>
									</tr>
									<tr>
										<td
											class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span
											class="ui-state-default">8</span></td>
										<td class=" undefined ui-datepicker-today"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a
											class="ui-state-default ui-state-highlight" href="#"
											aria-current="false" data-date="9">9</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="10">10</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="11">11</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="12">12</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="13">13</a></td>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="14">14</a></td>
									</tr>
									<tr>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="15">15</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="16">16</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="17">17</a></td>
										<td class=" undefined ui-datepicker-current-day"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a
											class="ui-state-default ui-state-active" href="#"
											aria-current="true" data-date="18">18</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="19">19</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="20">20</a></td>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="21">21</a></td>
									</tr>
									<tr>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="22">22</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="23">23</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="24">24</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="25">25</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="26">26</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="27">27</a></td>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="28">28</a></td>
									</tr>
									<tr>
										<td class=" ui-datepicker-week-end undefined"
											data-handler="selectDay" data-event="click" data-month="8"
											data-year="2024"><a class="ui-state-default" href="#"
											aria-current="false" data-date="29">29</a></td>
										<td class=" undefined" data-handler="selectDay"
											data-event="click" data-month="8" data-year="2024"><a
											class="ui-state-default" href="#" aria-current="false"
											data-date="30">30</a></td>
										<td
											class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
										<td
											class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
										<td
											class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
										<td
											class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
										<td
											class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<input type="hidden" name="is_calendar" id="is_calendar" value="y">
					<form>
						<div class="time_select selectBox" style="display: block;">
							<p class="selectbox_title" style="display: block;">
								시간선택
								<button type="button" class="time_btn active" value="14:00">
									<span class="option_title">14:00</span>
								</button>
								<button type="button" class="time_btn" value="16:20">
									<span class="option_title">16:20</span>
								</button>
							</p>
						</div>
						<div class="title1_select selectBox" style="display: none;">
							<p class="selectbox_title">옵션선택</p>
						</div>
						<div class="title2_select selectBox" style="display: block;">
							<p class="selectbox_title" style="display: block;">
								권종선택
								<button type="button" class="title2_btn btn_number_420478"
									name="420478"
									value="{&quot;number&quot;:&quot;420478&quot;,&quot;product_number&quot;:&quot;5229&quot;,&quot;run_date&quot;:&quot;2024-09-18 14:00:00&quot;,&quot;title1&quot;:&quot;★타임세일★&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;timesale&quot;,&quot;full_price&quot;:&quot;55000&quot;,&quot;sale_price&quot;:&quot;19800&quot;,&quot;jaego&quot;:&quot;4&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2024-09-18 13:00:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}">
									<span style="color: #ff4b4b;" class="option_title">★타임세일★</span><span
										class="title2_left">남은티켓 4매</span><span
										style="color: #ff4b4b;" class="title2_price">19,800원</span>
								</button>
								<button type="button" class="title2_btn btn_number_414659"
									name="414659"
									value="{&quot;number&quot;:&quot;414659&quot;,&quot;product_number&quot;:&quot;5229&quot;,&quot;run_date&quot;:&quot;2024-09-18 14:00:00&quot;,&quot;title1&quot;:&quot;선착순할인&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;&quot;,&quot;full_price&quot;:&quot;55000&quot;,&quot;sale_price&quot;:&quot;21900&quot;,&quot;jaego&quot;:&quot;20&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2024-09-18 13:00:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}">
									<span class="option_title">선착순할인</span><span
										class="title2_left">남은티켓 20매</span><span class="title2_price">21,900원</span>
								</button>
								<button type="button"
									class="title2_btn btn_number_414660 active" name="414660"
									value="{&quot;number&quot;:&quot;414660&quot;,&quot;product_number&quot;:&quot;5229&quot;,&quot;run_date&quot;:&quot;2024-09-18 14:00:00&quot;,&quot;title1&quot;:&quot;일반&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;&quot;,&quot;full_price&quot;:&quot;55000&quot;,&quot;sale_price&quot;:&quot;25000&quot;,&quot;jaego&quot;:&quot;20&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2024-09-18 13:00:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}">
									<span class="option_title">일반</span><span class="title2_left">남은티켓
										20매</span><span class="title2_price">25,000원</span>
								</button>
							</p>
						</div>
						<div class="choice_select" style="display: block;">
							<p class="title">수량선택</p>
							<div class="select_list">
								<div class="select_item" id="414660">
									<input type="hidden" name="cate_title[]" class="cate_title"
										value="9.18[수] 14:00 일반">
									<div class="select_name" style="float: left;">9.18[수]
										14:00&nbsp;일반&nbsp;</div>
									<div style="float: right; display: inline-block;">
										<a href="#item_close" class="close" data-store="414660"><span
											class="remove_ticket"
											style="font-size: 14px; border: 1px solid #888; border-radius: 5px; width: 16px; padding: 0 6px; color: #fff; background: #888;"
											value="25000">X</span></a>
									</div>
									<div style="clear: both;"></div>
									<div class="price_warp">
										<div class="quantity">
											<button type="button" class="remove_ticket" value="25000">
												<img src="${pageContext.request.contextPath}/resources/images/musical_detail/btn_minus.png"
													style="width: 18px; vertical-align: -3px;">
											</button>
											<span class="selected_quantity">1</span>
											<button type="button" class="add_ticket" value="25000">
												<img src="${pageContext.request.contextPath}/resources/images/musical_detail/btn_plus.png"
													style="width: 18px; vertical-align: -3px;">
											</button>
										</div>
										<p class="price">25,000원</p>
										<input type="hidden" name="product_cate[]" value="414660"><input
											type="hidden" name="product_cate_price[]" class="item_price"
											value="25000"><input type="hidden"
											name="product_cate_fullprice[]" value="55000"><input
											type="hidden" name="item_jaego" class="item_jaego" value="20"><input
											type="hidden" name="cate_date[]" class="cate_date"
											value="2024-09-18"><input type="hidden"
											name="want_quantity[]" class="item_ticket" value="1">
									</div>
								</div>
							</div>
						</div>
						<div class="total_warp" style="display: flex;">
							<p class="title">총 결제금액</p>
							<p class="total_price">25,000원</p>
						</div>
						<div class="submit_btn">
							<button href="#" class="">결제하기</button>
						</div>
					</form>
				</div>
			</div>

			<!----- 가격노출영역 // 판매종료일때 ----->
			<div class="price_section_etc"
				style="font-size: 16px; background-color: #ddd; display: none;">
				📢 판매 종료된 티켓입니다.<br>
			</div>

			<!----- 가격노출영역 // 판매대기일때 ----->
			<div class="price_section_etc"
				style="font-size: 16px; background-color: #e8e8ff; display: none;">
				⏳ 티켓 등록이 진행중입니다.</div>

			<!----- 가격노출영역 // 오픈예정일때 ----->
			<div class="price_section_etc"
				style="font-size: 16px; background-color: #ffe4e4; display: none;">
				🎫 티켓 오픈 : 2023-08-22 00:00:00</div>
		</section>
		</form>
</div>

	<section style="width: 820px; margin: 0 auto; padding-top: 20px;">
		<div class="review_preview" style="height: 100%;">
			<div class="review_preview_container">
				<div class="review_preview_title_section">
					<div class="review_preview_left">
						<span class="review_preview_title">이용후기</span> <span
							class="review_preview_number">242</span> <span
							class="review_preview_title">평점</span> <span
							class="review_preview_number" style="color: #ff4b4b;">4.8/5</span>
					</div>
					<div class="review_preview_right">
						후기 더보기 <span class="review_preview_right_btn"></span>
					</div>
				</div>
				<div class="review_preview_samples">
					<div class="review_wrap" id="user_review_1110132">
						<div class="review_title">
							<div class="review_title_left">
								<div class="review_title_left_stars">
									<div class="review_title_left_star">
										<div class="review_title_left_star_filled"
											style="width: calc(3 * 19px);"></div>
									</div>
								</div>
								<div class="review_title_left_name" style="padding-left: 10px;">
									*솔</div>
							</div>
							<div class="review_title_right" style="padding-right: 8px;">
								2024-09-08</div>
						</div>

						<div class="review_text">
							<div class="review_text_area" id="sample_review_0">살짝 루즈해지는
								것도 있지만 중간중간 감초같은 배우가 잘 이끌어주시네요~좌석 배치도 집중하기 좋았습니다! 종이티켓이 아닌 게 살짝
								아쉽네요 내 갬성..ㅎ!</div>
							<div class="review_text_seemore" id="sample_seemore_0"
								onclick="showFullReviewForSample(0)" style="display: none;">
								... 더보기</div>
						</div>

						<div style="margin-top: 10px;">
							<div viewmode="off"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/musical_detail/img_1112918.jpeg)"
								name="wys2/user_review/5229/img_1110132.jpeg"
								onclick="showOriginalRatio(0)" class="sample_img_label 0">
							</div>
						</div>
					</div>

					<div class="review_wrap" id="user_review_1068261">
						<div class="review_title">
							<div class="review_title_left">
								<div class="review_title_left_stars">
									<div class="review_title_left_star">
										<div class="review_title_left_star_filled"
											style="width: calc(5 * 19px);"></div>
									</div>
								</div>
								<div class="review_title_left_name" style="padding-left: 10px;">
									김*태</div>
							</div>
							<div class="review_title_right" style="padding-right: 8px;">
								2024-09-07</div>
						</div>

						<div class="review_text">
							<div class="review_text_area" id="sample_review_1">초6 아이와
								재미있게 봤습니다</div>
							<div class="review_text_seemore" id="sample_seemore_1"
								onclick="showFullReviewForSample(1)" style="display: none;">
								... 더보기</div>
						</div>

						<div style="margin-top: 10px;">
							<div viewmode="off"
								style="background-image: url(${pageContext.request.contextPath}/resources/images/musical_detail/img_1068261.jpeg)"
								name="wys2/user_review/5229/img_1068261.jpeg"
								onclick="showOriginalRatio(1)" class="sample_img_label 1">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section style="width:820px; margin:0 auto; padding-top:20px;">

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

      </div>
    </div>
  </section>










<jsp:include page="../include/bottom.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
//dropdown
//JavaScript to toggle dropdown menu visibility
document.getElementById('cs-dropdown').addEventListener('mouseover', function(event) {
    event.preventDefault(); // Prevent default link behavior
    const dropdownMenu = document.getElementById('cs-dropdown-menu');
    dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
});



// Hide the dropdown when clicking outside
document.addEventListener('click', function(event) {
    const dropdownMenu = document.getElementById('cs-dropdown-menu');
    const isClickInside = document.getElementById('cs-dropdown').contains(event.target);
    if (!isClickInside && dropdownMenu.style.display === 'block') {
        dropdownMenu.style.display = 'none';
    }
});

//carousel
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');
let currentIndex = 0;

// 모든 슬라이드에 부드러운 전환 효과 추가
slides.forEach((slide) => {
    slide.style.transition = 'transform 0.5s ease-in-out';
});

dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
        currentIndex = index;
        slides.forEach((slide) => {
            slide.style.transform = `translateX(-${currentIndex * 100}%)`;
        });
    });
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight' && currentIndex < slides.length - 1) {
        currentIndex++;
    } else if (e.key === 'ArrowLeft' && currentIndex > 0) {
        currentIndex--;
    }
    slides.forEach((slide) => {
        slide.style.transform = `translateX(-${currentIndex * 100}%)`;
    });
});

//card
document.addEventListener('DOMContentLoaded', function () {
    CardsMove("new-open");
    CardsMove("time-sale");

    function CardsMove(className) {
        // 선택자에서 .${className} 대신 `.className` 사용
        const cardsContainer = document.querySelector(`.${className}.cards`);
        const cards = document.querySelectorAll(`.${className}.card`);
        const prevBtn = document.querySelector(`.${className}.prev-btn`);
        const nextBtn = document.querySelector(`.${className}.next-btn`);

        console.log(cardsContainer, cards, prevBtn, nextBtn);

        let currentIndex = 0;
        const maxIndex = cards.length - 5; // 5개가 한 번에 보이기 때문

        function updateCardsPosition() {
            cardsContainer.style.transform = `translateX(-${currentIndex * 240}px)`; // 220px 카드 너비 + 20px 마진
        }

        nextBtn.addEventListener('click', function () {
            if (currentIndex < maxIndex) {
                currentIndex++;
                updateCardsPosition();
            }
        });

        prevBtn.addEventListener('click', function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateCardsPosition();
            }
        });
    }
});

//calendar
 let date = new Date();

const renderCalender = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();
   
    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;
   
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);
   
    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();
   
   const TLDate = thisLast.getDate();
   const TLDay = thisLast.getDay();
   
    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];
   
    if(PLDay !== 6) {
       for(let i = 0; i < PLDay + 1; i++) {
           prevDates.unshift(PLDate - i);
       }
    }
   
    for (let i = 1; 1 < 7 - TLDay; i++) {
       nextDates.push(i);
    }
   
    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = new dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);

    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
                          ? 'this'
                          : 'other';
       dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
    });
   
    document.querySelector('.dates').innerHTML =dates.join('');

    const today = new Date();
    if(viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('todaty');
                break;
            } 
        }
    }
};

renderCalender();

const prevMonth = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalender();
};

const nextMonth = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalender();
};

const goToday = () => {
    date = new Date();
    renderCalender();
};

</script>



</body>
</html>