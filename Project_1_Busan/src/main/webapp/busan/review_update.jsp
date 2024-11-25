<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- <script type="text/javascript" src="../shadow/js/shadowbox.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* $('#reviewUpdateBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_update.do',
			player:'iframe',
			title:'리뷰 수정',
			width: 640,
			height: 480
		})
	}) */
	
	$('#reviewUpdateBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()===""){
			$('#id').focus();
			return;
		}
		
		let score=$('#score').val()
		if(score.trim()===""){
			$('#subject').focus();
			return;
		}
		
		let cont=$('#cont').val()
		if(cont.trim()===""){
			$('#cont').focus();
			return;
		}
		
		let img=$('#img').val()
		
		let password=$('#password').val()
		if(password.trim()===""){
			$('#password').focus();
			return;
		}
		
		let rno=$('#rno').val()
		
		/* $.ajax({
			type:'post',
			url:'../busan/review_update_ok.do',
			data:{"rno":rno,"id":id,"score":score,
				 "cont":cont,"password":password},
			success:function(result){ //out.write
			
				if(result==="yes"){
					location.href="../busan/review.do?rno="+rno;
				}
				else{
					alert("비밀번호가 틀립니다.")
					$('#password').val("")
					$('#password').focus()
				}
			},
			error:function(err){
				alert(err)
			}
			
		}) */
	})
</script>
</head>
<body>
	<div class="review-insert review-update">
        <form method="post" action="../busan/review_update_ok.do">
			<table class="table">
				<tr>
					<th width=15%>아이디</th>
					<td width=85% id="id" value="${rvo.id}">${sessionScope.id}</td>
				</tr>
				
				<tr>
					<th width="15%">카테고리</th>
					<td width="85%" value="${rvo.cateno}">
						<select class="cate">
		        			<option value="1">명소</option>
		        			<option value="2">맛집</option>
		        			<option value="3">축제</option>
		        			<option value="4">체험</option>
		        			<option value="5">전시</option>
		        			<option value="6">특산물</option>
		        		</select>
					</td>
				</tr>
				
				<tr>
					<th width=15%>평점</th>
					<td width=85%>
						<input type="text" name="score" id="score" value="${rvo.score}" required>
					</td>
				</tr>
				<tr>
					<th width=15%>이미지</th>
					<td width=85%>
						<input type="file" name="img" id="img" value="${rvo.img}" required>
					</td>
				</tr>
				<tr>
					<th width=15%>내용</th>
					<td width=85%>
						<textarea rows="10" cols="60" name="cont" id="cont" value="${rvo.cont}" required style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<th width=15%>비밀번호</th>
					<td width=85%>
						<input type="password" name="password" id="password" value="${rvo.password}" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn-sm btn-success" value="수정" id="reviewUpdateBtn">수정</button>
	           			<button class="btn-sm btn-info" value="취소" id="reviewCancelBtn" onclick="javascript:history.back()">취소</button>
	         		</td>
	       		</tr>
	    	</table>
	    </form>
    </div>
</body>
</html>