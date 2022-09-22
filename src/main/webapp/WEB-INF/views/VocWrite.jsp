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
<!-- <script type="text/javascript" src="js/*"></script> -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div id="Ques_WriteForm">
		<h1>배상정보입력</h1>

		<form action="QuestionWrite" id="Q_WriteForm" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">질문 유형</span> <select
					class="form-select" id="autoSizingSelect" name="q_category">
					<option selected>(선택하세요)</option>
					<option value="1">회원 정보</option>
					<option value="2">기타</option>
				</select>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon2">제목</span> <input
					type="text" class="form-control" aria-label="Recipient's username"
					aria-describedby="basic-addon2" name="q_subject">
			</div>

			<div class="input-group">
				<span class="input-group-text">내용</span>
				<textarea class="form-control" aria-label="With textarea"
					name="q_content"></textarea>
			</div>


			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
</body>
</html>