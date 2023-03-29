<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글쓰기</h2>
	<form method="post" action="${ cp }/board/writePro">
		<table border="1">
			<tr>
				<td>게시글 종류</td>
				<td>
					<select name="boardType">
						<option value="1">일반</option>
						<option value="2">자유</option>
						<option value="3">Q&A</option>
						<option value="4">익명</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>게시글 번호</td>
				<td>${ maxNum }</td>
			</tr>
			<tr>
				<td>게시글 제목</td>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<c:if test="${ sessionScope.log eq null }">
						<input type="text" name="writer">
					</c:if>
					<c:if test="${ sessionScope.log ne null }">
						${ sessionScope.log }
					</c:if>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="30" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>