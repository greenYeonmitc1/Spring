<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h2>회원가입</h2>
	<form method="post" action="${ cp }/member/joinPro">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script>

</script>