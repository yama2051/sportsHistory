<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sportsName}の歴史</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/history.css">
</head>

<body>
	<header>
		<h1>${sportsName}の歴史 🏛</h1>
		<p>ここでは野球の歴史について年表形式で学ぶことができます。</p>
	</header>

	<!-- 国別タブ -->
<div>
    <a href="${pageContext.request.contextPath}/detail/baseball/japan">
        <button class="tab-button ${country == 'japan' ? 'active' : ''}">日本🗾</button>
    </a>
    
    <a href="${pageContext.request.contextPath}/detail/baseball/america"> 
        <button class="tab-button ${country == 'america' ? 'active' : ''}">アメリカ🗽</button>
    </a>
    
    <a href="${pageContext.request.contextPath}/detail/baseball/korea"> 
        <button class="tab-button ${country == 'korea' ? 'active' : ''}">韓国</button>
    </a>
</div>

	<div class="filter-container">
		<label for="keywordInput">🔍 キーワード検索：</label>
		<input type="text" id="keywordInput" onkeyup="filterTimeline()" placeholder="例：WBC、プロ野球 など">
	</div>

	<!-- 年表本体 -->
	<div id="timeline-${country}" class="timeline-country">
		<div class="timeline">
			<c:forEach var="event" items="${events}">
				<div class="timeline-item ${event.important ? 'highlight':'' }" onclick="toggleDetail(this)">
					<div class="year">${event.year}年</div>
					<div class="event"><c:if test="${event.important}">⭐</c:if> ${event.event}${event.event}</div>
					<c:if test="${not empty event.detail}">
						<div class="detail">${event.detail}</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<section id="categorySports">
		<h3>【同じカテゴリーのスポーツ】</h3>
			<c:forEach var="categoryRef" items="${relatedSports}">
    			<li>
        			<a href="${pageContext.request.contextPath}/detail/${categoryRef.sportsName}">
                    ${categoryRef.sportsName} </a>
    			</li>
			</c:forEach>
	
	</section>
	
	<section id="reference-section">
		<h3>【参考ページ先】</h3>
		<ul>
			<c:forEach var="ref" items="${pageUrlList}">
    			<li>
        			<a href="${ref.pageUrl}" target="_blank">${ref.pageName}</a>
    			</li>
			</c:forEach>
		</ul>
	</section>

	<footer>
		<a href="${pageContext.request.contextPath}/" class="btn">トップページへ</a>
	</footer>
<script src="<%= request.getContextPath() %>/js/timeline.js"></script>
<script src="${pageContext.request.contextPath}/js/theme.js" defer></script>
</body>
</html>
