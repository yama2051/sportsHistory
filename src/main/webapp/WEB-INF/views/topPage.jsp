<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>スポーツの歴史サイト</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css">
</head>
<body>
<header>
    <h1>スポーツの歴史を学ぼう！</h1>
    <p>このサイトでは、さまざまなスポーツの起源や歴史を簡単に学べます。</p>
</header>

	<div class="chumokuSports">
		<h3>本日の注目スポーツ！</h3>
		<c:if test="${not empty todaysSports and todaysSports.highlight}"> 
		    <p>
		        <a href="${pageContext.request.contextPath}${todaysSports.pathUrl}">
		            ${todaysSports.name} ✨
		        </a>
		        <c:if test="${not empty todaysSports.comment}">
		            - ${todaysSports.comment}
		        </c:if>
		    </p>
		</c:if>
		<c:if test="${empty todaysSports or not todaysSports.highlight}">
		    <p>本日の注目スポーツは現在ありません。</p>
		</c:if>
	</div>

    	<div>
    	 	 <form action="/search" method="get">
    			<label>競技名で検索</label>
    			<input type="text" name="sportName">
    			<button type="submit">検索</button>
    		</form>
    	</div>
    	
<div class="sportsBtn" id="sportsIchiranBtn">
    <a href="${pageContext.request.contextPath}/detail/baseball" class="btn">⚾ 野球</a>
    <a href="${pageContext.request.contextPath}/detail/soccer" class="btn">⚽ サッカー</a>
    <a href="${pageContext.request.contextPath}/detail/judo" class="btn">🥋 柔道</a>
    <a href="${pageContext.request.contextPath}/detail/basketball" class="btn">🏀 バスケ</a>
    <a href="${pageContext.request.contextPath}/detail/swimming" class="btn">🏊 水泳</a>
    <a href="${pageContext.request.contextPath}/detail/kendo" class="btn"> 剣道</a>
    <a href="${pageContext.request.contextPath}/detail/wrestling" class="btn">🥋 レスリング</a>
    <a href="${pageContext.request.contextPath}/detail/athletics" class="btn">🏃 陸上競技</a>
    <a href="${pageContext.request.contextPath}/detail/tennis" class="btn">🎾 テニス</a>
    <a href="${pageContext.request.contextPath}/detail/volleyball" class="btn">🏐 バレーボール</a>
    <a href="${pageContext.request.contextPath}/detail/gymnastics" class="btn">🤸 体操</a>
    <a href="${pageContext.request.contextPath}/detail/tabletennis" class="btn">🏓 卓球</a>
    <a href="${pageContext.request.contextPath}/detail/badminton" class="btn">🏸 バドミントン</a>
    <a href="${pageContext.request.contextPath}/detail/golf" class="btn">⛳ ゴルフ</a>
    <a href="${pageContext.request.contextPath}/detail/boxing" class="btn">🥊 ボクシング</a>
    <a href="${pageContext.request.contextPath}/detail/rugby" class="btn">🏉 ラグビー</a>
    <a href="${pageContext.request.contextPath}/detail/aikido" class="btn">合気道</a>
	<a href="${pageContext.request.contextPath}/detail/icehockey" class="btn">🏒 アイスホッケー</a>
	<a href="${pageContext.request.contextPath}/detail/aquadance" class="btn">アクアダンス</a>
	<a href="${pageContext.request.contextPath}/detail/americanfootball" class="btn">🏈 アメリカンフットボール</a>
	<a href="${pageContext.request.contextPath}/detail/archery" class="btn">🏹 アーチェリー</a>
	<a href="${pageContext.request.contextPath}/detail/armwrestling" class="btn">💪 アームレスリング</a>
	<a href="${pageContext.request.contextPath}/detail/iaido" class="btn">居合道</a>
	<a href="${pageContext.request.contextPath}/detail/unicycle" class="btn">一輪車</a>
	<a href="${pageContext.request.contextPath}/detail/indiaca" class="btn">インディアカ</a>
	<a href="${pageContext.request.contextPath}/detail/windsurfing" class="btn">ウィンドサーフィン</a>
	<a href="${pageContext.request.contextPath}/detail/waveski" class="btn">ウェーブスキー</a>
	<a href="${pageContext.request.contextPath}/detail/weighttraining" class="btn">ウエイトトレーニング</a>
	<a href="${pageContext.request.contextPath}/detail/weightlifting" class="btn">ウエイトリフティング</a>
	<a href="${pageContext.request.contextPath}/detail/walkrally" class="btn">ウォークラリー</a>
	<a href="${pageContext.request.contextPath}/detail/wallhandball" class="btn">ウォールハンドボール</a>
	<a href="${pageContext.request.contextPath}/detail/walking" class="btn">ウォーキング</a>
	<a href="${pageContext.request.contextPath}/detail/aerobic" class="btn">エアロビック</a>
	<a href="${pageContext.request.contextPath}/detail/airsportshooting" class="btn">エアースポーツシューティング</a>
	<a href="${pageContext.request.contextPath}/detail/eskitenis" class="btn">エスキーテニス</a>
	<a href="${pageContext.request.contextPath}/detail/oztag" class="btn">オズタグ</a>
	<a href="${pageContext.request.contextPath}/detail/orienteering" class="btn">オリエンテーリング</a>
	<a href="${pageContext.request.contextPath}/detail/okgolf" class="btn">オーケーゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/australianfootball" class="btn">オーストラリアンフットボール</a>
	<a href="${pageContext.request.contextPath}/detail/autocamping" class="btn">オートキャンプ</a>
	
	<a href="${pageContext.request.contextPath}/detail/canoe" class="btn">カヌー</a>
	<a href="${pageContext.request.contextPath}/detail/kabaddi" class="btn">カバディ</a>
	<a href="${pageContext.request.contextPath}/detail/karatedo" class="btn">🥋 空手道</a>
	<a href="${pageContext.request.contextPath}/detail/kangaroocricket" class="btn">カンガクリケット</a>
	<a href="${pageContext.request.contextPath}/detail/curling" class="btn">🥌 カーリング</a>
	<a href="${pageContext.request.contextPath}/detail/balloon" class="btn">🎈 気球</a>
	<a href="${pageContext.request.contextPath}/detail/qigong" class="btn">気功</a>
	<a href="${pageContext.request.contextPath}/detail/kickbaseball" class="btn">キックベースボール</a>
	<a href="${pageContext.request.contextPath}/detail/casting" class="btn">キャスティング</a>
	<a href="${pageContext.request.contextPath}/detail/camp" class="btn">キャンプ</a>
	<a href="${pageContext.request.contextPath}/detail/kyudo" class="btn">弓道</a>
	<a href="${pageContext.request.contextPath}/detail/cricket" class="btn">🏏 クリケット</a>
	<a href="${pageContext.request.contextPath}/detail/croquet" class="btn">クロッケー</a>
	<a href="${pageContext.request.contextPath}/detail/crolity" class="btn">クロリティー</a>
	<a href="${pageContext.request.contextPath}/detail/glider" class="btn">グライダー</a>
	<a href="${pageContext.request.contextPath}/detail/groundgolf" class="btn">グラウンド・ゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/grassski" class="btn">グラススキー</a>
	<a href="${pageContext.request.contextPath}/detail/kenbiso" class="btn">健美操</a>
	<a href="${pageContext.request.contextPath}/detail/gateball" class="btn">ゲートボール</a>
	<a href="${pageContext.request.contextPath}/detail/korfball" class="btn">コーフボール</a>
	<a href="${pageContext.request.contextPath}/detail/goalball" class="btn">ゴールボール</a>
	
	<a href="${pageContext.request.contextPath}/detail/cycling" class="btn">🚴 サイクリング・自転車</a>
	<a href="${pageContext.request.contextPath}/detail/cyclesoccer" class="btn">サイクルサッカー</a>
	<a href="${pageContext.request.contextPath}/detail/cyclefigure" class="btn">サイクルフィギュア</a>
	<a href="${pageContext.request.contextPath}/detail/3btaisou" class="btn">3B体操</a>
	<a href="${pageContext.request.contextPath}/detail/sambo" class="btn">サンボ</a>
	<a href="${pageContext.request.contextPath}/detail/surfing" class="btn">🏄 サーフィン</a>
	<a href="${pageContext.request.contextPath}/detail/shuttleball" class="btn">シャトルボール</a>
	<a href="${pageContext.request.contextPath}/detail/shuffleboard" class="btn">シャフルボード</a>
	<a href="${pageContext.request.contextPath}/detail/shootboxing" class="btn">シュートボクシング</a>
	<a href="${pageContext.request.contextPath}/detail/shorinjikempo" class="btn">少林寺拳法</a>
	<a href="${pageContext.request.contextPath}/detail/shorttennis" class="btn">ショートテニス</a>
	<a href="${pageContext.request.contextPath}/detail/shorttrack" class="btn">ショートトラックスピードスケート</a>
	<a href="${pageContext.request.contextPath}/detail/shintakkyu" class="btn">新卓球（ラージボール）</a>
	<a href="${pageContext.request.contextPath}/detail/jetsports" class="btn">ジェットスポーツ</a>
	<a href="${pageContext.request.contextPath}/detail/jikyojustsu" class="btn">自彊術</a>
	<a href="${pageContext.request.contextPath}/detail/jazztymnastics" class="btn">ジャズ体操</a>
	<a href="${pageContext.request.contextPath}/detail/jazzdance" class="btn">ジャズダンス</a>
	<a href="${pageContext.request.contextPath}/detail/joyathlon" class="btn">ジョイアスロン</a>
	<a href="${pageContext.request.contextPath}/detail/jogging" class="btn">ジョギング・ランニング</a>
	<a href="${pageContext.request.contextPath}/detail/waterpolo" class="btn">🤽 水球</a>
	<a href="${pageContext.request.contextPath}/detail/waterski" class="btn">水上スキー</a>
	<a href="${pageContext.request.contextPath}/detail/skydive" class="btn">スカイダイビング</a>
	<a href="${pageContext.request.contextPath}/detail/squash" class="btn">スカッシュ</a>
	<a href="${pageContext.request.contextPath}/detail/ski" class="btn">⛷️ スキー</a>
	<a href="${pageContext.request.contextPath}/detail/scubadiving" class="btn">スクーバダイビング</a>
	<a href="${pageContext.request.contextPath}/detail/skateboard" class="btn">🛹 スケートボード</a>
	<a href="${pageContext.request.contextPath}/detail/streetbasket" class="btn">ストリートバスケット（3x3）</a>
	<a href="${pageContext.request.contextPath}/detail/snowboard" class="btn">🏂 スノーボード</a>
	<a href="${pageContext.request.contextPath}/detail/snowmobile" class="btn">スノーモービル</a>
	<a href="${pageContext.request.contextPath}/detail/speedskate" class="btn">⛸️ スピードスケート</a>
	<a href="${pageContext.request.contextPath}/detail/sports-onigokko" class="btn">スポーツ鬼ごっこ</a>
	<a href="${pageContext.request.contextPath}/detail/sportskite" class="btn">スポーツカイト</a>
	<a href="${pageContext.request.contextPath}/detail/sportsdiving" class="btn">スポーツダイビング</a>
	<a href="${pageContext.request.contextPath}/detail/sportschanbara" class="btn">スポーツチャンバラ</a>
	<a href="${pageContext.request.contextPath}/detail/snowballfight" class="btn">スポーツ雪合戦®</a>
	<a href="${pageContext.request.contextPath}/detail/spaulbourg" class="btn">スポールブール</a>
	<a href="${pageContext.request.contextPath}/detail/sumo" class="btn">🤼‍♂️ 相撲</a>
	<a href="${pageContext.request.contextPath}/detail/sailtraining" class="btn">セイルトレーニング</a>
	<a href="${pageContext.request.contextPath}/detail/sepaktakraw" class="btn">セパタクロー</a>
	<a href="${pageContext.request.contextPath}/detail/sailing" class="btn">⛵ セーリング</a>
	<a href="${pageContext.request.contextPath}/detail/softvolleyball" class="btn">ソフトバレーボール</a>
	<a href="${pageContext.request.contextPath}/detail/softball" class="btn">🥎 ソフトボール</a>
	<a href="${pageContext.request.contextPath}/detail/songleading" class="btn">ソングリーディング（チアダンス）</a>
	
	<a href="${pageContext.request.contextPath}/detail/taspony" class="btn">タスポニー</a>
	<a href="${pageContext.request.contextPath}/detail/touchfootball" class="btn">タッチフットボール</a>
	<a href="${pageContext.request.contextPath}/detail/touchrugby" class="btn">タッチラグビー</a>
	<a href="${pageContext.request.contextPath}/detail/targetbirdgolf" class="btn">ターゲット・バードゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/doubledutch" class="btn">ダブルダッチ</a>
	<a href="${pageContext.request.contextPath}/detail/dancesports" class="btn">💃 ダンススポーツ</a>
	<a href="${pageContext.request.contextPath}/detail/darts" class="btn">🎯 ダーツ</a>
	<a href="${pageContext.request.contextPath}/detail/tschoukball" class="btn">チュックボール</a>
	<a href="${pageContext.request.contextPath}/detail/tugofwar" class="btn">綱引競技</a>
	<a href="${pageContext.request.contextPath}/detail/fishing" class="btn">🎣 釣り</a>
	<a href="${pageContext.request.contextPath}/detail/teeball" class="btn">ティーボール</a>
	<a href="${pageContext.request.contextPath}/detail/duathlon" class="btn">デュアスロン</a>
	<a href="${pageContext.request.contextPath}/detail/denmarktymnastics" class="btn">デンマーク体操</a>
	<a href="${pageContext.request.contextPath}/detail/tossbaseball" class="btn">トスベースボール</a>
	<a href="${pageContext.request.contextPath}/detail/triathlon" class="btn">トライアスロン</a>
	<a href="${pageContext.request.contextPath}/detail/trampolinebics" class="btn">トランポビクス</a>
	<a href="${pageContext.request.contextPath}/detail/trampoline" class="btn">トランポリン</a>
	<a href="${pageContext.request.contextPath}/detail/trittball" class="btn">トリットボール</a>
	<a href="${pageContext.request.contextPath}/detail/trekking" class="btn">トレッキング</a>
	<a href="${pageContext.request.contextPath}/detail/dodgeball" class="btn">ドッジボール</a>
	<a href="${pageContext.request.contextPath}/detail/dragonboat" class="btn">ドラゴンボート</a>
	
	<a href="${pageContext.request.contextPath}/detail/naginata" class="btn">なぎなた</a>
	<a href="${pageContext.request.contextPath}/detail/nastarrace" class="btn">ナスターレース</a>
	<a href="${pageContext.request.contextPath}/detail/jumprope" class="btn">なわとび</a>
	<a href="${pageContext.request.contextPath}/detail/netball" class="btn">ネットボール</a>
	
	<a href="${pageContext.request.contextPath}/detail/hiking" class="btn">ハイキング</a>
	<a href="${pageContext.request.contextPath}/detail/hanggliding" class="btn">ハンググライディング</a>
	<a href="${pageContext.request.contextPath}/detail/handball" class="btn">ハンドボール</a>
	<a href="${pageContext.request.contextPath}/detail/bmx" class="btn">BMX</a>
	<a href="${pageContext.request.contextPath}/detail/boundtennis" class="btn">バウンドテニス</a>
	<a href="${pageContext.request.contextPath}/detail/equestrian" class="btn">🐎 馬術</a>
	<a href="${pageContext.request.contextPath}/detail/batontwirling" class="btn">バトントワリング</a>
	<a href="${pageContext.request.contextPath}/detail/pattpatgolf" class="btn">パットパットゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/paddletennis" class="btn">パドルテニス</a>
	<a href="${pageContext.request.contextPath}/detail/paragliding" class="btn">パラグライディング</a>
	<a href="${pageContext.request.contextPath}/detail/parachutesports" class="btn">パラシュートスポーツ</a>
	<a href="${pageContext.request.contextPath}/detail/powerlifting" class="btn">パワーリフティング</a>
	<a href="${pageContext.request.contextPath}/detail/parkgolf" class="btn">パークゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/billiards" class="btn">🎱 ビリヤード</a>
	<a href="${pageContext.request.contextPath}/detail/beachsoccer" class="btn">ビーチサッカー</a>
	<a href="${pageContext.request.contextPath}/detail/beachvolleyball" class="btn">ビーチバレーボール</a>
	<a href="${pageContext.request.contextPath}/detail/beachfootball" class="btn">ビーチフットボール</a>
	<a href="${pageContext.request.contextPath}/detail/beachball" class="btn">ビーチボール</a>
	<a href="${pageContext.request.contextPath}/detail/faustball" class="btn">ファウストボール</a>
	<a href="${pageContext.request.contextPath}/detail/figureskate" class="btn">⛸️ フィギュアスケート</a>
	<a href="${pageContext.request.contextPath}/detail/finswimming" class="btn">フィンスイミング</a>
	<a href="${pageContext.request.contextPath}/detail/fencing" class="btn">🤺 フェンシング</a>
	<a href="${pageContext.request.contextPath}/detail/folkdance" class="btn">フォークダンス</a>
	<a href="${pageContext.request.contextPath}/detail/futsal" class="btn">フットサル</a>
	<a href="${pageContext.request.contextPath}/detail/footbag" class="btn">フットバッグ</a>
	<a href="${pageContext.request.contextPath}/detail/flyingdisc" class="btn">フライングディスク</a>
	<a href="${pageContext.request.contextPath}/detail/flagfootball" class="btn">フラッグフットボール</a>
	<a href="${pageContext.request.contextPath}/detail/frisbeedog" class="btn">フリスビードッグ</a>
	<a href="${pageContext.request.contextPath}/detail/freetennis" class="btn">フリーテニス</a>
	<a href="${pageContext.request.contextPath}/detail/floorhockey" class="btn">フロアホッケー</a>
	<a href="${pageContext.request.contextPath}/detail/bujuttaikyokuken" class="btn">武術太極拳</a>
	<a href="${pageContext.request.contextPath}/detail/broomball" class="btn">ブルームボール</a>
	<a href="${pageContext.request.contextPath}/detail/boomerang" class="btn">ブーメラン</a>
	<a href="${pageContext.request.contextPath}/detail/pencaksilat" class="btn">プンチャック・シラット</a>
	<a href="${pageContext.request.contextPath}/detail/petanque" class="btn">ペタンク</a>
	<a href="${pageContext.request.contextPath}/detail/hosteling" class="btn">ホステリング</a>
	<a href="${pageContext.request.contextPath}/detail/hockey" class="btn">🏑 ホッケー</a>
	<a href="${pageContext.request.contextPath}/detail/horseshoes" class="btn">ホースシューズ</a>
	<a href="${pageContext.request.contextPath}/detail/bowling" class="btn">🎳 ボウリング</a>
	<a href="${pageContext.request.contextPath}/detail/boccia" class="btn">ボッチャ</a>
	<a href="${pageContext.request.contextPath}/detail/bodybuilding" class="btn">ボディビル</a>
	<a href="${pageContext.request.contextPath}/detail/bodyboard" class="btn">ボディボード</a>
	<a href="${pageContext.request.contextPath}/detail/boat" class="btn">🚣 ボート</a>
	<a href="${pageContext.request.contextPath}/detail/polo" class="btn">ポロ</a>
	
	<a href="${pageContext.request.contextPath}/detail/microlightplane" class="btn">マイクロライトプレーン</a>
	<a href="${pageContext.request.contextPath}/detail/mountainbike" class="btn">🚴 マウンテンバイク</a>
	<a href="${pageContext.request.contextPath}/detail/makkoh" class="btn">真向法</a>
	<a href="${pageContext.request.contextPath}/detail/malletgolf" class="btn">マレットゴルフ</a>
	<a href="${pageContext.request.contextPath}/detail/motorcyclesports" class="btn">🏍️ モーターサイクル・スポーツ</a>
	
	<a href="${pageContext.request.contextPath}/detail/unicurl" class="btn">ユニカール</a>
	<a href="${pageContext.request.contextPath}/detail/unihoc" class="btn">ユニホック</a>
	
	<a href="${pageContext.request.contextPath}/detail/lifesaving" class="btn">ライフセービング</a>
	<a href="${pageContext.request.contextPath}/detail/lacrosse" class="btn">🥍 ラクロス</a>
	<a href="${pageContext.request.contextPath}/detail/rugbyleague" class="btn">ラグビーリーグ</a>
	<a href="${pageContext.request.contextPath}/detail/racquetball" class="btn">ラケットボール</a>
	<a href="${pageContext.request.contextPath}/detail/radioexercies" class="btn">ラジオ体操</a>
	<a href="${pageContext.request.contextPath}/detail/rollerski" class="btn">ローラースキー</a>
	<a href="${pageContext.request.contextPath}/detail/rollerskates" class="btn">ローラースケート/インラインスケート</a>
	<a href="${pageContext.request.contextPath}/detail/lawnbowls" class="btn">ローンボウルズ</a>
</div>

<!--ページネーション -->
	<ul class="pagenation">
	 <li>
	 	<a href="#">1</a>
	 </li>
	 <li>
	 	<a href="#">2</a>
	 </li>
	 <li>
	 	<a href="#">3</a>
	 </li>
	 <li>
	 	<a href="#">4</a>
	 </li>
	</ul>    
    
</body>
</html>