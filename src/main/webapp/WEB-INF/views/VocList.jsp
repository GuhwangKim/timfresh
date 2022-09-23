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
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	fetch ('http://localhost:8999/vboard')
	.then(res => {
		console.log(res);
		return res.json();
	}
	)
	.then(data => {
		console.log(data)
		for (var i = 0, ii = data.length; i < ii; i++) {
			var str=data[i];
			if(str.resp==0){
	        	str.resp='고객사'
	        } else if (str.resp==1) {
	        	str.resp='운송사'
			} 
			
			
	        if(str.refyn==0){
	        	str.refyn='배상없음'
	        } else if (str.refyn==11) {
	        	str.refyn='<button onclick="location.href=&#039;refPush?claimno='+str.claimno+'&#039;">배상등록</button>'
			} else if (str.refyn==12) {
	        	str.refyn='배상등록완료'
			}
	        
	        
	        if(str.driverynd==3){
	        	str.driverynd='-'
	        } else if (str.driverynd==0) {
	        	str.driverynd='확인중'
			} else if (str.driverynd==1) {
	        	str.driverynd='승인'
			} else if (str.driverynd==2) {
	        	str.driverynd='거부'
			}
	        
			$('#table1').append("<tr><td>"+str.claimno+"</td><td>"+str.resp+"</td><td>"+str.respcont+"</td><td>"+str.refyn+"</td><td>"+str.driverynd+"</td></tr>");
		
		}
		
	})
	.catcher(err => {
		console.log("Fetch Error",err);
	})
</script>
<body>
	<table class="table table-striped">
		<thead id="table_header">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">귀책당사자</th>
				<th scope="col">귀책내용</th>
				<th scope="col">배상요청여부</th>
				<th scope="col">기사확인여부</th>
			</tr>
		</thead>
		<tbody id="table1">
		</tbody>
		
	</table>
</body>
</html>