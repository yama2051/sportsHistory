<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>野球の歴史</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/history.css">
</head>

<body>
	<header>
		<h1>野球の歴史 🏛</h1>
		<p>ここでは野球の歴史について年表形式で学ぶことができます。</p>
	</header>

	<!-- 国別タブ -->
<div>
    <a href="${pageContext.request.contextPath}/detail/baseball/japan">
        <button class="tab-button ${country == 'japan' ? 'active' : ''}">日本🗾</button>
    </a>
    <a href="${pageContext.request.contextPath}/detail/baseball/usa"> <button class="tab-button ${country == 'United States' ? 'active' : ''}">アメリカ🗽</button>
    </a>
    <a href="${pageContext.request.contextPath}/detail/baseball/korea"> <button class="tab-button ${country == 'South Korea' ? 'active' : ''}">韓国</button>
    </a>
</div>

	<!-- キーワード検索（※今回は機能しません。JavaScriptが必要） -->
	<div class="filter-container">
		<label for="keywordInput">🔍 キーワード検索：</label>
		<input type="text" id="keywordInput" onkeyup="filterTimeline()" placeholder="例：WBC、プロ野球 など">
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
	
	<div>
		<h2>類似競技</h2>
	</div>
	
	<section id="reference-section">
		<h3>【参考ページ先】</h3>
		<ul>
			<li>
				<a href="https://example.com/baseball-history" target="_blank" rel="noopener noreferrer">日本野球機構（NPB）- 野球の歴史</a>
			</li>
			<li>
				<a href="${pageUrl.pageUrl}" target="_blank" rel="noopener noreferrer">
                        ${pageUrl.pageName}</a>
			</li>
		</ul>
	</section>

	<footer>
		<a href="${pageContext.request.contextPath}/" class="btn">トップページへ</a>
	</footer>
<script src="<%= request.getContextPath() %>/js/timeline.js"></script>
<script src="${pageContext.request.contextPath}/js/theme.js" defer></script>
</body>
</html>
