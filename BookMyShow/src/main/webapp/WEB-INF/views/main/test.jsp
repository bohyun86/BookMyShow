<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .datepicker{	max-width:110px;	text-align:center;	display:inline-block;}
        
    </style>

</head>
<body>

    <th>등록기간</th> 
    <td>
    <input type="text" id="startDt" name="startDt" class="form-control datepicker" th:value="${param.startDt}" readonly /> -  
    <input type="text" id="endDt" name="endDt" class="form-control datepicker" th:value="${param.endDt}" readonly />
    </td>


    <script>
        datePicker: function(){    $(".datepicker[type=text]").datepicker(        {            dateFormat: 'yy-mm-dd',            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월'],            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],            weekHeader: 'Wk',            changeMonth: true, 
        // 월변경가능            
        changeYear: true, // 년변경가능            
        yearRange: '2000:+5', // 연도 셀렉트 박스 범위            
        showMonthAfterYear: true, // 년 뒤에 월 표시            
        buttonImageOnly: true, // 이미지표시            
        buttonText: '날짜를 선택하세요',            autoSize: true, 
        // 오토리사이즈(body등 상위태그의 설정에 따른다)            
        buttonImage: '/front/img/calendar_icon.png', // 이미지주소            
        showOn: "both" // 엘리먼트와 이미지 동시 사용        
        });}
    
    </script>
</body>
</html>