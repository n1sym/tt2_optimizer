

window.onload = function(){
  
'use strict';

 // 入力欄からデータをセット
 const relicInput = document.getElementById('relic');
 const bosInput = document.getElementById('bos');
 const buildInput = document.getElementById('build');
 const goldInput = document.getElementById('gold');
 const hero1Input = document.getElementById('hero1');
 const hero2Input = document.getElementById('hero2');

 const resultDivided = document.getElementById('result-area');
 
 const optimiseButton = document.getElementById('optimise');
 
 // 出力欄のテンプレート
 const answers = "bos:{relic}\n bos2:{relic}\n ~~~";
 
 // 計算 ⇒ 最終的に 配列optimiseLV[] に各々AFの最適lvを配置したい。




 // ページの動作など
 function removeAllChildren(element) {
     while (element.firstChild) { // 子どもの要素があるかぎり削除
       element.removeChild(element.firstChild);
     }
   }

 optimiseButton.onclick = () => {
    const relic = relicInput.value;
    if (relic.length === 0) { // 入力が空の時は処理を終了する
      alert("入力が不十分です");
      return;
    }
    
     // 結果表示エリア
    removeAllChildren(resultDivided);
    const header = document.createElement('h3');
    header.innerText = '結果';
    resultDivided.appendChild(header);

    const paragraph = document.createElement('p');
    let result = answers
    result = result.replace(/{relic}/g, relic);
    
    paragraph.innerText = result;
    resultDivided.appendChild(paragraph);
  
  };

};