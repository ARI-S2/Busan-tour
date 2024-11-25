<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
<style>
.table_content a {
	border: 1px solid #0923A9;
	display: inline-block;
	border-radius: 25px;
	padding: 5px 18px;
	margin: 0px auto;
	margin-bottom: 10px;
	color: #0923A9;
	width: 80px;
	text-align: center;
}

.table_content .text-left {
	border-bottom-style: none;
}

.table_content a:hover {
	background-color: #0923A9;
	color: white;
	text-decoration: none;
}

.table_content a:focus {
	background-color: #0923A9;
	color: white;
	text-decoration: none;
}

div.container {
	margin-bottom: 130px;
}

#notice .container {
	margin-top: 50px;
	margin: 0px auto;
}

#notice .row {
	margin: 0px auto;
	position: relative;
}

.table th {
	background-color: #eee;
}

.table {
	margin-top: 150px;
}

#notice h1 {
	margin-top: 40px;
}

#notice .pagination {
	margin-bottom: 70px;
}

#noticesearch {
	position: absolute;
	right: 0%;
	top: 22%;
}

#noticesearch button {
	margin-left: 5px;
	height: 30px;
	width: 50px;
	border-radius: 50px;
	font-weight: bold;
}

#noticesearch #searchbar {
	height: 30px;
	width: 250px;
}

#insert {
	position: absolute;
	left: 0%;
	top: 22%;
}

#insert button {
	height: 30px;
	width: 50px;
	font-weight: bold;
}

.table_content {
	width: 100%;
	margin-top: 110px;
	height: 540px;
}

.table_content {
	border-collapse: collapse;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	border-top-color: #333;
	border-bottom-color: #333;
}

.table_content th, td {
	margin: 0px;
	padding: 10px;
}

.table_content th {
	background-color: #0923A9;
	color: #fff;
	border-bottom-width: 1px;
	border-bottom-color: #333;
}

.table_content td {
	border-bottom-width: 1px;
	border-bottom-color: #666;
	border-bottom-style: dotted;
}

.table_content .dataTr:HOVER {
	background-color: #FC6;
	cursor: pointer;
	cursor: hand;
}

.table_content .tdleft {
	text-align: left;
}

.table_content .tdcenter {
	text-align: center;
}

.text-center {
	text-align: center;
}

.text-center {
	text-align: center;
}

center {
	margin-top: 150px;
	margin-bottom: 100px;
	height: 600px;
}

#cont {
	height: 300px;
}

#cont>pre {
	height: 100%;
	font-size: 16px;
	background-color: #fcfcfc;
}

h4 {
	font-size: 45px;
	margin-bottom: 30px;
}
#notice .input-sm{
    border-radius: revert-layer;
    font-size: 14px;
}
#notice .btn-group-sm>.btn, .btn-sm{
    font-size: 14px;
    border-radius: 50px;
    width: 70px;
}

input[type=file]::file-selector-button {
    border: 1px solid #0923A9;
	display: inline-block;
	padding: 1px;
	margin: 0px 0px;
	margin-right:10px;
	margin-bottom:50px;
	color: #0923A9;
	width: 80px;
	height:25px;
	text-align: center;
	font-family: 'Pretendard';
	
}
input[type=file]::file-selector-button:hover{
    background-color: #0923A9;
    color: white;
    

}
#file:focus {
    outline: none;
}
#file{
    position: relative;
    bottom: 3px;
}
.btn-primary{
    background-color: #0923A9;
    border-color: black;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active{
   background-color: #0923A9 !important;
   border-color: black !important;
}
</style>

</head>
<body>
	<div class="container" id="notice">
	<h1 style="text-align: center">답변하기</h1>
		<div class="row">
			<form method="post" action="../admin/admin_qna_insert.do" enctype="multipart/form-data">
			  <input type="hidden" name="gid" value="${vo.group_id }">
			<table class="table_content" width=800>

				<tr>
					<th width=15% class="text-center">작성자</th>
					<td width="85%"><input type=text name=name size=20
						class="input-sm" value="관리자(${sessionScope.id }) "required></td>
				</tr>
				
				<tr>
					<th width=15% class="text-center">제목</th>
					<td width="85%"><input type=text name=subject size=55
						class="input-sm" required></td>
				</tr>	
				
				<tr>
					<th width=15% class="text-center">첨부파일</th>
					<td width="85%"><input type=file name=upload id="file"
						class="input-sm">
			        </td>
				</tr>			

				<tr id=cont>
					<th width=15% class="text-center">내용</th>
					<td width="85%">
						<textarea rows="20" style="width:100%;height:100%" required
						name=cont>
작성자: ${vo.name }
아이디: <c:if test="${vo.id == null  }"> 비회원 </c:if><c:if test="${vo.id != null  }"> ${vo.id}</c:if>	
제목: ${vo.subject }
내용: 
${vo.cont }

============================================================
</textarea></td>
				</tr>

				<tr>
					<th width=15% class="text-center">비밀번호</th>
					<td width="85%"><input type=password name=pwd size=20
						class="input-sm" required></td>
				</tr>

				<tr>
					<td colspan="2" class="text-right"><input type=submit
						value="글쓰기" class="btn-primary btn-sm"> <input type=button
						value="취소" class="btn-primary btn-sm"
						onclick="javacript:window.close()"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>