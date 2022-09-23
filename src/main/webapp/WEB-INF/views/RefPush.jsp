<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배상정보등록</title>
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
</head>

<script type="text/javascript">
	var claimno = '${claimno}';
	
	fetch ('http://localhost:8999/vrboard/'+claimno)
	.then(res => {
		console.log(res);
		return res.json();
	}
	)
	.then(data => {
		console.log(data)
			$('#delname').append(data.delname);
			$('#dempname').append(data.dempname);
			$('#dempphone').append(data.dempphone);
		}
		
	)
	.catcher(err => {
		console.log("Fetch Error",err);
	})
	
	
	function rsave() {
		var claimno = String($('#claim').val());
		var refyn= String(12); // 등록완료
		
		var jsonData=JSON.stringify({
			refcont: $('#vcontent').val(),
			refprice: $('#vprice').val(),
			driverynd: 0, // 승인중
		});
		
		$.ajax({
			url:"http://localhost:8999/vboard/rpush",
			type: "POST",
			data: {"claimno":claimno, "refyn":refyn},
			data: jsonData, 
			contentType: "application/json",
			dataType: "json",
			success: function(){
				alert('성공');
				return true;
			}
			
		})
		
		
	}
</script>


<body>
	<div id="Ques_WriteForm">
		<div>
			<h1>배상정보입력</h1>
		</div>

		<form action="refList" id="frm" method="post" onsubmit="rsave();">
			<h5>운송사명</h5>
			<span id="delname"></span>
			<h5>기사 이름</h5>
			<span id="dempname"></span>
			<h5>기사 번호</h5>
			<span id="dempphone"></span> 
			<input type="hidden" id="claim" value="${claimno}"/>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon2">패널티 내용</span>
				<textarea type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="q_subject" id="vcontent"></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-text">패널티 금액</span>
				<input type="number" class="form-control" aria-label="With textarea" name="q_content" id="vprice"></input>
			</div>
			<div>
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>
	</div>
</body>
</html>