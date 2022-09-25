<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ref상세보기</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- js -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	var refno = '${refno}';
	fetch ('http://localhost:8999/rboard/'+refno)
	.then(res => {
		console.log(res);
		return res.json();
	}
	)
	.then(data => {
	 	if(data.refyn==0){
	 		data.refyn='배상없음'
        } else if (data.refyn==11) {
        	data.refyn='배상요청'
		} else if (data.refyn==12) {
			data.refyn='배상등록완료';
		}
        
        if(data.resp==0){
        	data.resp='고객사'
        } else if (data.resp==1) {
        	data.resp='운송사'
		} 
        
        if(data.driverynd==3){
        	data.driverynd='-'
        } else if (data.driverynd==0) {
        	data.driverynd='확인중'
		} else if (data.driverynd==1) {
			data.driverynd='승인'
		} else if (data.driverynd==2) {
			data.driverynd='거부'
		}
        
        $('#refno').append(data.refno);
        $('#claimno').append(data.voc.claimno);
		$('#orderno').append(data.orderno);
		$('#refcont').append(data.refcont);
		$('#refprice').append(data.refprice);
		$('#driverynd').append(data.driverynd);
		$('#resp').append(data.voc.resp);
		$('#respcont').append(data.voc.respcont);
		$('#refyn').append(data.voc.refyn);
		$('#clientname').append(data.voc.clientcorp.clientname);
		$('#cempname').append(data.voc.clientcorp.cempname);
		$('#cempphone').append(data.voc.clientcorp.cempphone);
		$('#delname').append(data.voc.delcorp.delname);
		$('#dempname').append(data.voc.delcorp.dempname);
		$('#dempphone').append(data.voc.delcorp.dempphone);
	}
	)
	.catcher(err => {
		console.log("Fetch Error",err);
	})
</script>
</head>
<body>
	<h5>배상번호 : <span id="refno"></span></h5>
	<h5>클레임번호 : <span id="claimno"></span></h5>
	<h5>주문번호 : <span id="orderno"></span></h5>
	<h5>패널티내용 : <span id="refcont"></span></h5>
	<h5>패널티금액 :  : <span id="refprice"></span></h5>
	<h5>기사확인여부 : <span id="driverynd"></span></h5>
	<h5>귀책당사자 : <span id="resp"></span></h5>
	<h5>귀책내용 : <span id="respcont"></span></h5>
	<h5>배상요청여부 : <span id="refyn"></span></h5>
	<h5>고객사명 : <span id="clientname"></span></h5>
	<h5>고객사 담당자 : <span id="cempname"></span></h5>
	<h5>고객사 담당자 연락처  : <span id="cempphone"></span></h5>
	<h5>운송사명 : <span id="delname"></span></h5>
	<h5>기사 이름 : <span id="dempname"></span></h5>
	<h5>기사 연락처 : <span id="dempphone"></span> </h5>
</body>
</html>