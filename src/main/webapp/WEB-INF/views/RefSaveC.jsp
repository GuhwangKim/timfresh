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
		var jsonData=JSON.stringify({
			claimno: $('#clnum').val(),
			refcont: $('#vcontent').val(),
			refprice: $('#vprice').val(),
			driverynd: 3, // 승인중
			refyn: 12 // 등록완료
		});
		
		$.ajax({
			url:"http://localhost:8999/vboard/rpush",
			type: "POST",
			data: jsonData, 
			contentType: "application/json",
			dataType: "json",
			success: function(){
				alert('입력성공');
				return true;
			}
		})
	}
</script>


<body>
	<div id="Ques_WriteForm">
		<div>
			<h1>고객사 배상 입력</h1>
		</div>
		<form action=refList id="frm" method="post" onsubmit="rsave();">
			<div class="input-group mb-3">
				<span class="input-group-text">클레임번호</span>
				<input type="number" class="form-control" aria-label="With textarea" name="q_content" id="clnum" required="required"></input>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon2">패널티 내용</span>
				<textarea type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="q_subject" id="vcontent" required="required"></textarea>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">패널티 금액</span>
				<input type="number" class="form-control" aria-label="With textarea" name="q_content" id="vprice" required="required"></input>
			</div>
			<div>
				<button class="btn btn-primary" type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>
	</div>
</body>
</html>