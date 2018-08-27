<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript" src="/resources/include/js/board.js"></script>
<script type="text/javascript">
	r_name = "${roomData.r_name}";
	r_size = "${roomData.r_size}";
	r_standard = "${roomData.r_standard}";
	r_max = "${roomData.r_max}";
	r_cvc = "${roomData.r_cvc}";
</script>

<table class="table table-striped">
		<thead>
			<tr>
				<th class="tac">객실번호</th>
				<th class="tac">객실명</th>
				<th class="tac">객실크기</th>
				<th class="tac">객실기준인원</th>
				<th class="tac">객실최대인원</th>
				<th class="tac">객실편의사항</th>
			</tr>
		</thead>
		<tbody>
			<!-- 데이터 출력  -->
			<c:choose>
				<c:when test="${not empty roomList}">
					<c:forEach var="room" items="${roomList}" varStatus="status">
						<tr class="tac" data-num="${room.r_no}">
							<td>${room.r_no}</td>
							<td class="goDetail tal">${room.r_name}</td>
							<td>${room.r_size}</td>
							<td>${room.r_standard}</td>
							<td>${room.r_max }</td>
							<td>${room.r_cvc }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

