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
	<table border="1">
		<tr>
			<td align="center">Type</td>
			<td align="center">No</td>
			<td align="center">Title</td>
		</tr>
		<c:if test="${ boardList eq null }">
			<tr>
				<td>작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${ boardList ne null }">
			<c:forEach var="board" items="${ boardList }">
				<tr>
					<td align="center">
						<c:if test="${ board.boardType eq 0 }">일반</c:if>
						<c:if test="${ board.boardType eq 1 }">자유</c:if>
						<c:if test="${ board.boardType eq 2 }">Q&nsd;A</c:if>
						<c:if test="${ board.boardType eq 3 }">익명</c:if>
					</td>
					<td align="center">${ board.boardNo }</td>
					<td>
						<a href="${ cp }/board/content?boardNo=${ board.boardNo }">${ board.title }</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>