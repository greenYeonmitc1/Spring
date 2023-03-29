<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
	<form method="post" action="${ cp }/member/loginPro">
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
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>