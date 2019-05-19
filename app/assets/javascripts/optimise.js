

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
 
 // afデータ一覧
 /**
 ArtifactID	id	Name
 Artifact22	0	  Book of Shadows
 Artifact95	1	  charged card
 Artifact2	2	  Stone of the Valrunes
 Artifact19	3	  Chest of Contentment
 Artifact1	4	  Heroic Shield
 Artifact20	5	  Book of Prophecy
 Artifact66	6	  khr bowl
 Artifact43	7	  Zakynthos Coin
 Artifact44	8	  Great Fay Medallion
 Artifact45	9	  neko
 Artifact79	10	ebizu
 Artifact82	11	compass
 Artifact94	12	evergrowing stack
 Artifact84	13	flute
 Artifact26	14	Heavenly Sword
 Artifact31	15	Divine Retribution
 Artifact29	16	Drunken Hammer
 Artifact51	17	Samosek Sword
 Artifact59	18	The Retaliator
 Artifact83	19	styr peace
 Artifact35	20	Hero's Blade
 Artifact32	21	The Sword of Storms
 Artifact33	22	Furies Bow
 Artifact34	23	Charm of the Ancient
 Artifact61	24	Tiny Titan Tree
 Artifact62	25	Helm of Hermes
 Artifact38	26	Fruit of Eden
 Artifact30	27	Influential Elixir
 Artifact64	28	O'Ryan's Charm
 Artifact52	29	Heart of Storms
 Artifact53	30	Apollo Orb
 Artifact67	31	earing portara
 Artifact42	32	Avian Feather
 Artifact46	33	Corrupted Rune Heart
 Artifact55	34	Durendal Sword
 Artifact56	35	Helheim Skull
 Artifact75	36	0ath
 Artifact76	37	crown
 Artifact77	38	titania
 Artifact78	39	fagin
 Artifact40	40	Ring of Calisto
 Artifact25	41	Blade of Damocles
 Artifact17	42	Helmet of Madness
 Artifact23	43	Titanium Plating
 Artifact73	44	moonlight 
 Artifact28	45	Amethyst Staff
 Artifact86	46	Sword of the Royals
 Artifact87	47	Spearit's Vigil
 Artifact88	48	The Cobalt Plate
 Artifact89	49	Sigils of Judgement
 Artifact90	50	Foliage of the Keeper
 Artifact47	51	Invader's Gjallarhorn
 Artifact11	52	Titan's Mask
 Artifact41	53	Royal Toxin
 Artifact9	54	Laborer's Pendant
 Artifact10	55	Bringer of Ragnarok
 Artifact7	56	Parchment of Foresight
 Artifact6	57	Elixir of Eden
*/

 const growthExpo =[
   1.087,
   1.35,
   0.97,
   1.35,
   1.35,
   1.45,
   1.149,
   1.4,
   1.4,
   1.4,
   1.4,
   1.4,
   1.5,
   1.135,
   1.5,
   1.28,
   1.22,
   1.6,
   1.22,
   1.149,
   1.2,
   1.22,
   1.22,
   1.22,
   1.22,
   1.22,
   1.4,
   1.2,
   1.25,
   1,
   1.177,
   1.132,
   1.3,
   1.2,
   1.35,
   1.3,
   1.177,
   1.177,
   1.177,
   1.177,
   0.9,
   1.36,
   1.36,
   1.55,
   1.36,
   1.36,
   1.1,
   1.1,
   1.1,
   1.1,
   1.1,
   1,
   1.28,
   1.35,
   1.35,
   1.25,
   1.25,
   1.28
   ];
   
 const texpo = [
   3.5000,
   2.8000,
   2.8000,
   2.8000,
   2.8000,
   3.2000,
   2.8000,
   2.8000,
   2.8000,
   2.8000,
   2.8000,
   2.8000,
   3.2000,
   3.2000,
   3.2000,
   3.0000,
   2.7000,
   3.0000,
   2.7000,
   3.0000,
   2.7000,
   2.7000,
   2.7000,
   2.7000,
   2.7000,
   2.7000,
   3.0000,
   2.7000,
   2.8000,
   3.2000,
   3.2000,
   2.7000,
   2.7000,
   2.7000,
   3.0000,
   3.0000,
   3.2000,
   3.2000,
   3.2000,
   3.2000,
   3.2000,
   3.0000,
   3.0000,
   3.0000,
   3.0000,
   3.0000,
   3.2000,
   3.2000,
   3.2000,
   3.2000,
   3.2000,
   2.8000,
   2.7000,
   2.7000,
   2.7000,
   2.7000,
   2.7000,
   2.7000
   ];
  
 const effectWeight = [
  1.016396,
  1.006623,
  1.003322,
  1.077217,
  1.077217,
  1.077217,
  1.013159,
  1.169607,
  1.091393,
  1.091393,
  1.062659,
  1.013159,
  1.006623,
  1.003322,
  1.016396,
  1.032280,
  1.032280,
  1.062659,
  1.032280,
  1.013159,
  1.047690,
  1.062659,
  1.062659,
  1.062659,
  1.062659,
  1.062659,
  1.032280,
  1.032280,
  1.032280,
  1.001664,
  1.006623,
  1.009902,
  1.144714,
  1.000083,
  1.074337,
  1.038499,
  1.006623,
  1.006623,
  1.006623,
  1.006623,
  1.003322,
  1.025986,
  1.025986,
  1.025986,
  1.025986,
  1.025986,
  1.006623,
  1.006623,
  1.006623,
  1.006623,
  1.006623,
  1.006623,
  1.032280,
  1.032280,
  1.032280,
  1.032280,
  1.032280,
  1.032280
  ];


 // ページの動作など
 function removeAllChildren(element) {
     while (element.firstChild) { // 子どもの要素があるかぎり削除
       element.removeChild(element.firstChild);
     }
   }



 optimiseButton.onclick = () => {
   
   const total_relic = relicInput.value;
   const bos_percent = bosInput.value;
   const build = buildInput.value;
   const gold = goldInput.value;
   const hero1 = hero1Input.value;
   const hero2 = hero2Input.value;
   
    if (total_relic.length === 0 || bos_percent.length === 0) { // 入力が空の時は処理を終了する
      alert("入力が不十分です");
      return;
    }
    
 // Reduction の計算
 
 var buildv = [0,0,0,0]; // SC,PET,CS,HS
 var goldv  = [0,0,0]; // フェア,phom,チェスた
 var hero1v = [0,0]; // 地面,飛行
 var hero2v = [0,0]; // 近・遠・魔
  
   if (build == "SC"){buildv[0] = 1;}
   if (build == "PET"){buildv[1] = 1;}
   if (build == "CS"){buildv[2] = 1;}
   if (build == "HS"){buildv[3] = 1;}
 
   if (gold == "フェアリー"){goldv[0] = 1;}
   if (gold == "pHoM"){goldv[1] = 1;}
   if (gold == "チェスターソン"){goldv[2] = 1;}
 
   if (hero1 == "地面"){hero1v[0] = 1;}
   if (hero1 == "飛行"){hero1v[1] = 1;} 
 
   if (hero2 == "近接"){hero2v[0] = 1;}
   if (hero2 == "遠隔"){hero2v[1] = 1;} 
   if (hero2 == "魔術"){hero2v[2] = 1;} 
 
 var r = []; // reduction
  r[0]  = 0; //bos
  r[1]  = 0.79; // CCa
  r[2]  = 0.79*4; // SotV
  r[3]  = 0.79*(goldv[0]+gold[2]); //CoC
  r[4]  = 0.79*(goldv[1]); //HSh
  r[5]  = 0.79; // BoP
  r[6]  = 0.79; // KB
  r[7]  = 0; //ZC
  r[8]  = 0.79*(goldv[0]); //GDM
  r[9]  = 0.79*(goldv[1]); //NS
  r[10] = 0.79*(goldv[2]); //CoE
  r[11] = 0.79*(goldv[0]+gold[1]); //TBC
  r[12] = 1; // ES
  r[13] = 4; // FotS
  r[14] = 1; //HSw
  r[15] = 1; //DR
  r[16] = 0.6*buildv[0]+(buildv[1]+buildv[3]); //DH
  r[17] = 0.6*buildv[0]+0.8*buildv[3]; //SS
  r[18] = 1; //Ret
  r[19] = r[16] + r[20]; //SP
  r[20] = 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]; //HB
  r[21] = r[20]*hero2v[0]; // TSoS
  r[22] = r[20]*hero2v[1]; // FB
  r[23] = r[20]*hero2v[2]; //CotA
  r[24] = r[20]*hero1v[0]; //TTI
  r[25] = r[20]*hero1v[1]; //HoH
  r[26] = buildv[1]; //FoE
  r[27] = buildv[2]; //IE
  r[28] = buildv[1]+buildv[0]+buildv[2]; //ORC
  r[29] = 4*r[20]+2*r[16]*2; //HoS
  r[30] = 0.79*2; //AO
  r[31] = 1; //EoP
  r[32] = 0; //AF
  r[33] = 0; // CRH
  r[34] = 0; //DSw
  r[35] = 1; //HSk
  r[36] = 2*r[16]+r[26]; //OB
  r[37] = 2*r[20]+r[27]; //CotC
  r[38] = r[52]+r[54]+r[57]; //TSc
  r[39] = r[8]+r[32]+r[53];//FG
  r[40] = r[41]+r[42]+r[43]+r[44]+r[45]; //RoC
  r[41] = 1; //BoD
  r[42] = Math.max(r[17],r[20]); // HoM
  r[43] = 0.79; //TP
  r[44] = Math.max(r[41],r[42],r[45]); //MB
  r[45] = 1;//AS
  r[46] = r[21]+r[41]; //SotR
  r[47] = r[25]+r[42]; //SV
  r[48] = r[24]+r[43]; //TCP
  r[49] = r[23]+r[44]; //SoJ
  r[50] = r[22]+r[45]; //FotK
  r[51] = r[52]+r[53]+r[54]+r[55]+r[56]+r[57]; //IG
  r[52] = buildv[3]; //TM
  r[53] = 0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]; //RT
  r[54] = (0.6*0.79)*goldv[1]+0.79*goldv[0]; //LP
  r[55] = r[16]; //BoR
  r[56] = r[20]; //PoF
  r[57] = buildv[0]; //EoE
  
  
  
  var costweight = [];
  for (var i=0; i<r.length; i++){
    costweight[i] = (effectWeight[i]*growthExpo[i]*r[i])/texpo[i];
  }
  
  var costweight_sum;
  for (var i=0; i<r.length; i++){
    costweight_sum += costweight[i];
  }
  
  var cost_percent = [];
  for (var i=0; i<r.length; i++){
    cost_percent[i] = costweight[i]/costweight_sum;
  }
  
    
    
     // 結果表示エリア
    removeAllChildren(resultDivided);
    const header = document.createElement('h3');
    header.innerText = '結果';
    resultDivided.appendChild(header);

    const paragraph = document.createElement('p');
    let result = answers;
    var num = total_relic*100;
    result = result.replace(/{relic}/g, total_relic) + bos_percent + num.toExponential(2);
    
    paragraph.innerText = result;
    resultDivided.appendChild(paragraph);
  
  };

};