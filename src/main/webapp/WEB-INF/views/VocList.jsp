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
			
	        if(str.refyn==0){
	        	str.refyn='배상없음'
	        } else if (str.refyn==11) {
	        	if(str.resp==0){
	        	str.refyn='<b>배상요청</b>'
	        	}else if (str.resp==1) {
		        	str.refyn='<button onclick="location.href=&#039;refSaveD?claimno='+str.claimno+'&#039;">배상등록</button>'
				}
			} else if (str.refyn==12) {
	        	str.refyn='<font color="green">배상등록완료</font>';
			}
	        
	        if(str.resp==0){
	        	str.resp='고객사'
	        } else if (str.resp==1) {
	        	str.resp='운송사'
			} 
			
	        if(str.driverynd==3){
	        	str.driverynd='-'
	        } else if (str.driverynd==0) {
	        	str.driverynd='확인중'
			} else if (str.driverynd==1) {
	        	str.driverynd='<font color="blue">승인</font>'
			} else if (str.driverynd==2) {
	        	str.driverynd='<font color="red">거부</font>'
			}
			$('#table1').append("<tr><td><a href='vocView?claimno="+str.claimno+"'>"+str.claimno+"</a></td><td>"+str.resp+"</td><td>"+str.respcont+"</td><td>"+str.refyn+"</td><td>"+str.driverynd+"</td></tr>");
		
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
				<th scope="col"><a>귀책당사자</a></th>
				<th scope="col">귀책내용</th>
				<th scope="col">배상요청여부</th>
				<th scope="col">기사확인여부</th>
			</tr>
		</thead>
		<tbody id="table1">
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="location.href='vocSave';">Voc등록</button>
	<button class="btn btn-primary" onclick="location.href='refList'">배상목록</button>
</body>
</html>