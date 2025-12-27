/**
 * 年表用
 */

function toggleDetail(element) {
  const detail = element.querySelector('.detail');
  if (detail) {
    // visible クラスのトグル
    detail.classList.toggle('visible');
  }
}

function showCountry(country, btn) {

}

/*フィルター用*/
function filterTimeline() {
  const keyword = document.getElementById('keywordInput').value.toLowerCase().trim(); // 前後の空白をトリム
  // 現在表示されているタイムラインコンテナを取得（常に一つだけあるはず）
  const currentTimeline = document.querySelector('.timeline-country'); // :not(.hidden) は不要、常に表示されているものがこれになるはず
  
  if (!currentTimeline) {
      console.warn("No timeline container found for filtering.");
      return;
  }

  const items = currentTimeline.querySelectorAll('.timeline-item');

  items.forEach(item => {
    // 年、イベント、詳細のテキストをすべて取得し、検索対象とする
    const yearText = item.querySelector('.year')?.textContent.toLowerCase() || "";
    const eventText = item.querySelector('.event')?.textContent.toLowerCase() || "";
    const detailText = item.querySelector('.detail')?.textContent.toLowerCase() || "";

    // 検索対象のテキストを結合
    const combinedText = yearText + " " + eventText + " " + detailText;

    if (combinedText.includes(keyword)) { // 結合したテキストでキーワードを検索
      item.style.display = ""; // 表示
    } else {
      item.style.display = "none"; // 非表示
    }
  });
}

// 初期ロード時またはタブ切り替え時（ページ再読込後）にフィルターをリセットするため
// DOMContentLoaded イベントでキーワード入力フィールドのイベントリスナーを設定
document.addEventListener('DOMContentLoaded', () => {
    const keywordInput = document.getElementById('keywordInput');
    if (keywordInput) {
        // onkeyup 属性がHTMLに設定されているため、ここでは特に何も追加する必要はないかもしれません。
        // ただし、もしHTMLから onkeyup を削除してJavaScriptで一元管理したい場合はここに addEventListener を追加します。
        // 例: keywordInput.addEventListener('keyup', filterTimeline);

        // ページロード時にキーワード入力欄をクリアし、フィルタリングをリセット
        keywordInput.value = '';
        filterTimeline(); // 全ての項目を表示状態に戻す
    }
});

