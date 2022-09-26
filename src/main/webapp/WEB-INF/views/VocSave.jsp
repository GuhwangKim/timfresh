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
	
<script type="text/javascript">
	function vsave() {
		var jsonData=JSON.stringify({
			orderno: $('#odno').val(),
			resp: $('#rp').val(),
			respcont: $('#rcontent').val(),
			refyn: $('#ryn').val(),
			clientno: $('#cn').val(),
			delno: $('#dc').val(),
		});
		$.ajax({
			url:"http://localhost:8999/vboard/vpush",
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
	
</head>
<body>
	<div id="Ques_WriteForm">
		<h1>voc등록</h1>

		<form action=vocList id="frm" method="post" onsubmit="vsave();">
			<div class="input-group mb-3">
				<span class="input-group-text">주문번호</span>
				<input type="number" class="form-control" aria-label="With textarea" name="q_content" id="odno"></input>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">귀책당사자</span> 
				<select class="form-select" id="rp" name="q_category">
					<option selected>(선택하세요)</option>
					<option value="0">고객사</option>
					<option value="1">운송사</option>
				</select>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon2">귀책내용</span>
				<textarea type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="q_subject" id="rcontent"></textarea>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">배상요청여부</span> 
				<select class="form-select" id="ryn" name="q_category">
					<option selected>(선택하세요)</option>
					<option value="0">배상없음</option>
					<option value="11">배상요청</option>
				</select>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">고객사선택</span> 
				<select class="form-select" id="cn" name="q_category">
					<option selected>(선택하세요)</option>
					<option value="1">베이킹몬</option>
				</select>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">운송사선택</span> 
				<select class="form-select" id="dc" name="q_category">
					<option selected>(선택하세요)</option>
					<option value="1">대한통운</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
</body>
</html>