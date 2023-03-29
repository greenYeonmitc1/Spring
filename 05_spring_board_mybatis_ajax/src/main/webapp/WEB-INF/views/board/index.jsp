<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	
	
	
	$(document).ready(function(){
		$(".allBtn").click(function (){
	    	let checked = $(".allBtn").is(":checked");
	    	if(checked){
	    		$('input:checkbox').prop('checked', true)
	    	}else{
	    		$('input:checkbox').prop('checked', false)
	    	}
		});
		
		$("#getBoardListForType").click(function(){
			let checkArr = [];
			$('input[id="type"]:checked').each(function(){
				let value = $(this).val();
				checkArr.push(value);
			});
			
			let query = {
				checkList : checkArr	
			};
			
			$.ajax({
				type : "post",
				url : contextPath+"/board/getBoardListForType",
				data : query,
				success : function(data){
					
					console.log(data);
			
					$("#myTable > #hello > tr").remove();
					
					let result = "";
					for(let i=0; i<data.length; i++){
						result += "<tr>";
						
						if(data[i].boardType == 1) {
							result += "<td align='center'>일반</td>";
						} else if(data[i].boardType == 2) {
							result += "<td align='center'>자유</td>";
						} else if(data[i].boardType == 3) {
							result += "<td align='center'>Q&A</td>";
						} else if(data[i].boardType == 4) {
							result += "<td align='center'>익명</td>";
						}
						result += "<td align='center'>" + data[i].boardNo + "</td>";
						result += "<td><a href='${ cp }/board/content?boardNo=${ board.boardNo }'>" + data[i].title + "</a></td>";
						result += "</tr>";
					}
					
					$("#myTable > tbody:last").append(result);
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>게시판리스트</h2>
	
	
	<br>
	<br>
	<table border="1" id="myTable">
		<tr>
			<td align="right" colspan="3">
				<c:if test="${ sessionScope.log eq null}">
					<a href="${ cp }/member/login">login</a> &nbsp;  &nbsp;
					<a href="${ cp }/member/join">join</a>  &nbsp;  &nbsp;
				</c:if>
				<c:if test="${ sessionScope.log ne null}">
					${ sessionScope.log } 회원님, 환영합니다.
					<a href="${ cp }/member/logout">로그아웃</a>
				</c:if>
				total : ${ count }							
			</td>
		</tr>
	
		<tr>
			<td align="right" colspan="3"><a href="${ cp }/board/write">글쓰기</a></td>
		</tr>
		<tr>
			<td align="center" width="100">Type</td>
			<td align="center" width="100">No</td>
			<td align="center" width="500">Title</td>
		</tr>
		<tbody id="hello">
		<c:if test="${ boardList eq null }">
			<tr>
				<td>작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${ boardList ne null }">
			<c:forEach var="board" items="${ boardList }">
					<tr>
						<td align="center">
							<c:if test="${ board.boardType eq 1 }">일반</c:if>
							<c:if test="${ board.boardType eq 2 }">자유</c:if>
							<c:if test="${ board.boardType eq 3 }">Q&A</c:if>
							<c:if test="${ board.boardType eq 4 }">익명</c:if>
						</td>
						<td align="center">
							${ board.boardNo }
						</td>
						<td>
							<a href="${ cp }/board/content?boardNo=${ board.boardNo }">${ board.title }</a>
						</td>
					</tr>				
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<br>
	
	
	<input type="checkbox" id="type" name="type" value="0" class="allBtn"> 전체
	<input type="checkbox" id="type" name="type" value="1"> 일반
	<input type="checkbox" id="type" name="type" value="2"> 자유
	<input type="checkbox" id="type" name="type" value="3"> Q&amp;A
	<input type="checkbox" id="type" name="type" value="4"> 익명
	<input type="button" value="조회" id="getBoardListForType">
	<br>
	
	
</body>
</html>