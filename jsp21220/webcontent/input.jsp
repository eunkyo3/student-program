<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%@ page import="java.sql.*" %>  
<%
	String sql = " select max(sno)+1 from student_tbl_03";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver1.2">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;
		
		if(!cv.sno.value){
			alert("학번을 입력해주시오.");
			cv.sno.focus();
			return false;
		}
		
		if(!cv.ekor.value){
			alert("국어점수를 입력해주시오.");
			cv.ekor.focus();
			return false;
		}
		
		if(!cv.emath.value){
			alert("수학점수를 입력해주시오.");
			cv.emath.focus();
			return false;
		}
		
		if(!cv.eeng.value){
			alert("영어점수를 입력해주시오.");
			cv.eeng.focus();
			return false;
		}
		
		if(!cv.ehist.value){
			alert("역사점수를 입력해주시오.");
			cv.ehist.focus();
			return false;
		}
		
		alert("학생 성적이 모두 완료되었습니다.");
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
	<h2 id="title">학생목록</h2>
	<form name="data" method="post" action="input_z.jsp" onsubmit="return checkValue()">
		<table class="table_line">
		<tr>
			<th>학번</th>
			<td><input type="text" name="sno" autofocus></td>
		</tr>
		<tr>
			<th>국어점수</th>
			<td><input type="text" name="ekor"></td>
		</tr>
		<tr>
			<th>수학점수</th>
			<td><input type="text" name="emath"></td>
		</tr>
		<tr>
			<th>영어점수</th>
			<td><input type="text" name="eeng"></td>
		</tr>
		<tr>
			<th>역사점수</th>
			<td><input type="text" name="ehist"></td>
		</tr>
		<tr>
				<th colspan="2">
					<input type="submit" value="등록하기">
					<input type="button" value="다시입력" onclick="location.href='input.jsp'">
					<input type="button" value="학생목록조회" onclick="location.href='student_list.jsp'">
				</th>	
		</tr>
	</table>
	</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>