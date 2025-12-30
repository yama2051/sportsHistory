<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>  <%-- ★この行を追加 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>サッカーの歴史</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/history.css">
</head>

<body>
	<header>
		<h1>サッカーの歴史 🏛</h1>
		<p>ここではサッカーの歴史について年表形式で学ぶことができます。</p>
	</header>

	<!-- 国別タブ -->
	<div>
		<a href="${pageContext.request.contextPath}/baseballDetail?country=japan">
			<button class="tab-button ${country == 'japan' ? 'active' : ''}">日本🗾</button>
		</a>
		<a href="${pageContext.request.contextPath}/baseballDetailUSA?country=usa">
			<button class="tab-button ${country == 'usa' ? 'active' : ''}">アメリカ🗽</button>
		</a>
		<a href="${pageContext.request.contextPath}/baseballDetailKOREA?country=korea">
			<button class="tab-button ${country == 'korea' ? 'active' : ''}">韓国</button>
		</a>
	</div>

	<!-- キーワード検索（※今回は機能しません。JavaScriptが必要） -->
	<div class="filter-container">
		<label for="keywordInput">🔍 キーワード検索：</label>
		<input type="text" id="keywordInput" onkeyup="filterTimeline()" placeholder="例：ワールドカップ、Jリーグ など">
	</div>

	<!-- 年表本体 -->
	<div id="timeline-${country}" class="timeline-country">
		<div class="timeline">
			<c:forEach var="event" items="${events}">
				<div class="timeline-item" onclick="toggleDetail(this)">
					<div class="year">${event.year}年</div>　
					<div class="event">${event.event}</div>
					<c:if test="${not empty event.detail}">
						<div class="detail">${event.detail}</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer>
		<a href="${pageContext.request.contextPath}/" class="btn">トップページへ</a>
	</footer>
<script src="<%= request.getContextPath() %>/js/timeline.js"></script>
<script src="${pageContext.request.contextPath}/js/theme.js" defer></script>
</body>
</html>
