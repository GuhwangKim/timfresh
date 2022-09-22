<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voc목록</title>
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
<script type="text/javascript">
	function vlist() {
		const config = {
				method: "get"
		};
		
		fetch ('http://localhost:8999/vboard', config)
			.then(res=>res.json())
			.then(data=>console.log(data))
			.then(data=>{
				var table = document.getElementById('table1')
	            for (var i = 0, ii = data.length; i < ii; i++) {
	                var spot = data[i];
	                
	                var row = '<tr> <td>${spot.claimno}</td><td>${spot.resp}</td><td>${spot.respcont}</td><td>${spot.refyn}</td><td>${spot.driverynd}</td></tr'
	        			table.innerHTML += row
				}
			}   
		)
	}



</script>
<body>
	<table class="table table-striped" >
		<thead id="table_header">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">귀책당사자</th>
				<th scope="col">귀책내용</th>
				<th scope="col">배상요청여부</th>
				<th scope="col">답변</th>
			</tr>
		</thead>
		<tbody id="table1">
		</tbody>
	</table>
</body>
</html>