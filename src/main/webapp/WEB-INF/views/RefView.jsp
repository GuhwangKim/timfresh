<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voc상세보기</title>
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
<body>
	<table class="table table-striped">
		<thead id="table_header">
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">답변</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">${question.q_num}</th>
				<td class="q_List">${question.q_subject}</td>
				<td class="q_List">${question.member.name}</td>
				<td class="q_List">${question.q_date}</td>
				<td class="q_List">확인중</td>
				<td class="q_List">답변 완료</td>
			</tr>
		</tbody>
	</table>
</body>
</html>