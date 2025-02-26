<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
	
	<div id="container">
		<!-- location_area -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<form action="#" class="minisrch_form">
				
				<fieldset>
					<select name="###" style="height: 35px;">
						<option value="#">제목</option>
						<option value="#">내용</option>
						<option value="#">작성자</option>
						<option value="#">제목+내용</option>
					</select>
					<legend>검색</legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<a href="javascript:;" class="btn_srch">검색</a>
				</fieldset>
			</form>
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.bno }</td>
						<td class="tit_notice"><a href="getContent.board?bno=${dto.bno }">${dto.title }</a> </td>
						<td>${dto.email }</td>
						<td>
							<fmt:parseDate var="time" value="${dto.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${time }" pattern="yyyy년MM월dd일"/>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<a href="javascript:;" class="firstpage  pbtn"><img src="img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="javascript:;" class="lastpage  pbtn"><img src="img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<%@ include file="../include/footer.jsp" %>

</div>
<!-- //wrap -->

<h2 class="hdd">빠른 링크 : 전화 문의,카카오톡,오시는 길,꼭대기로</h2>
<div class="quick_area">
	<ul class="quick_list">
		<li><a href="tel:010-7184-4403"><h3>전화 문의</h3><p>010-1234-5678</p></a></li>
		<li><a href="javascript:;"><h3>카카오톡 <em>상담</em></h3><p>1:1상담</p></a></li>
		<li><a href="javascript:;"><h3 class="to_contact">오시는 길</h3></a></li>
	</ul>
	<p class="to_top"><a href="#layout0" class="s_point">TOP</a></p>
</div>

</body>
</html>
