<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>refund목록</title>
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
	fetch ('http://localhost:8999/rboard')
	.then(res => {
		console.log(res);
		return res.json();
	}
	)
	.then(data => {
		console.log(data)
		for (var i = 0, ii = data.length; i < ii; i++) {
			var str=data[i];
	        if(str.driverynd==3){
	        	str.driverynd='-'
	        } else if (str.driverynd==0) {
	        	str.driverynd='확인중'
			} else if (str.driverynd==1) {
	        	str.driverynd='<font color="blue">승인</font>'
			} else if (str.driverynd==2) {
	        	str.driverynd='<font color="red">거부</font>'
			}
	        if(str.voc.resp==0){
	        	str.voc.resp='고객사'
	        } else if (str.voc.resp==1) {
	        	str.voc.resp='운송사'
			} 
	        
			$('#table2').append("<tr><td><a href='refView?refno="+str.refno+"'>"+str.refno+"</a><td>"+str.voc.claimno+"</td><td>"+str.voc.resp+"</td><td>"+str.refcont+"</td><td>"+str.refprice+"</td><td>"+str.driverynd+"</td></tr>");
		}
		
	})
	.catcher(err => {
		console.log("Fetch Error",err);
	})
	
	function cldninp() {
		var refno=prompt("배상번호입력");
		if(refno){
			location.href="driverChk?refno="+refno+""; 
		} else{ 
			alert("배상번호를 입력하세요")
			location.href="refList";
		}
	}
</script>
<body>
	<table class="table table-striped">
		<thead id="table_header">
			<tr>
				<th scope="col">배상번호</th>
				<th scope="col">클레임번호</th>
				<th scope="col">귀책당사자</th>
				<th scope="col">패널티내용</th>
				<th scope="col">패널티금액</th>
				<th scope="col">기사확인여부</th>
			</tr>
		</thead>
		<tbody id="table2">
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="location.href='refSaveC'">배상등록</button>
	<button class="btn btn-primary" onclick="location.href='vocList'">Voc목록</button>
	<button class="btn btn-primary" onclick="cldninp();">(임의)기사승인체크</button>
</body>
</html>