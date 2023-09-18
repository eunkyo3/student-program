<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>

<%
	String sql = " select sno 학번, "
	 + " sname 이름, "
	 + " substr(sno, 1, 1) 학년, "
	 + " substr(sno, 2, 2) 반, "
	 + " substr(sno, 4, 2) 번호, "
	 + " decode(sgender, 'M', '남', 'F', '여', 'X') 성별, "
	 + " sphone 전화번호, "
	 + " saddress 주소 "
	 + " from student_tbl_03 "
	 + " order by sno ";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver1.2">
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
	<table class="table_line">
		<tr align="center">
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		
		<% 
			while(rs.next()) {
		%>
		<tr align="center">
			<td><%= rs.getString("학번") %></td>
			<td><%= rs.getString("이름") %></td>
			<td><%= rs.getString("학년") %></td>
			<td><%= rs.getString("반") %></td>
			<td><%= rs.getString("번호") %></td>
			<td><%= rs.getString("성별") %></td>
			<td><%= rs.getString("전화번호") %></td>
			<td><%= rs.getString("주소") %></td>
		</tr>
		<%
			}
		%>
		
	</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>