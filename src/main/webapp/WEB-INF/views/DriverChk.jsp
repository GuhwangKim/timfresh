<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사승인확인</title>
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
	var refno = '${refno}';
	
	fetch ('http://localhost:8999/gdchk/'+refno)
	.then(res => {
		console.log(res);
		return res.json();
	}
	)
	.then(data => {
		console.log(data)
			$('#claimno').append(data.claimno);
			$('#refcont').append(data.refcont);
			$('#refprice').append(data.refprice);
	}
	)
	.catcher(err => {
		console.log("Fetch Error",err);
	})
	
	
	function dupdate() {
		var jsonData=JSON.stringify({
			refno: $('#ref').val(),
			driverynd: $('#dvynd').val()
		});
		
		$.ajax({
			url:"http://localhost:8999/pdchk/"+$('#ref').val(),
			type: "PUT",
			data: jsonData, 
			contentType: "application/json",
			dataType: "json",
			success: function(){
				alert('변경완료');
				return true;
			}
			
		})
	}
</script>


<body>
	<div id="Ques_WriteForm">
		<div>
			<h1>승인확인</h1>
		</div>
		<form action=refList id="frm" method="get" onsubmit="dupdate();">
			<input type="hidden" id="ref" value="${refno}"/>
			<input type="hidden" name="_method" value="put"/>
			<h5>클레임번호 : <span id="claimno"></span></h5>
			<h5>배상내용 : <span id="refcont"></span></h5>
			<h5>배상가격 : <span id="refprice"></span> </h5>
			<c:if test="${driverynd !=3}">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">기사확인여부</span> 
					<select class="form-select" id="dvynd" name="q_category">
						<option selected>(선택하세요)</option>
						<option value="1">승인</option>
						<option value="2">거부</option>
					</select>
				</div>
				<button class="btn btn-primary" type="submit">신청</button>
			</c:if>
		</form>
	</div>
</body>
</html>