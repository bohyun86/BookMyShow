<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>

IMP.init("imp41840484");

const button = document.querySelector("button");

const requestPay = async () => {
	IMP.request_pay({
		pg: "kakaopay",
		pay_method: "card",
		amount: "1000",
		name: "라면",
		merchant_uid: `payment-${crypto.randomUUID()}`
	}, function(rsp) {
		if (rsp.success) {
			console.log(rsp);
		} else {
			console.log(rsp);
		}	
	});
};

// musicalOrderDTO 객체를 안전하게 JSON 문자열로 변환하여 자바스크립트로 전달


// requestPay 함수 정의

</script>









<meta charset="UTF-8">
<title>[뮤지컬]</title>


</head>
<body>

<button onclick="requestPay()">결제하기</button>





</body>
</html>
