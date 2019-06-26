window.onload = function(){

'use strict';

 // 入力欄からデータをセット
 const relicInput = document.getElementById('relic');
 const bosInput = document.getElementById('bos');
 const afcInput = document.getElementById('afc');
 const buildInput = document.getElementById('build');
 const goldInput = document.getElementById('gold');
 const hero1Input = document.getElementById('hero1');
 const hero2Input = document.getElementById('hero2');

 const resultDivided = document.getElementById('result-area');
 
 const optimiseButton = document.getElementById('optimise');

 

 
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

 const afname = [
   "Book of Shadows",
   "Charged Card",
   "Stone of the Valrunes",
   "Chest of Contentment",
   "Heroic Shield",
   "Book of Prophecy",
   "Khrysos Bowl",
   "Zakynthos Coin",
   "Great Fay Medallion",
   "Neko Sculpture",
   "Coins of Ebizu",
   "The Bronzed Compass",
   "Evergrowing Stack",
   "Flute of the Soloist",
   "Heavenly Sword",
   "Divine Retribution",
   "Drunken Hammer",
   "Samosek Sword",
   "The Retaliator",
   "Stryfe's Peace",
   "Hero's Blade",
   "The Sword of Storms",
   "Furies Bow",
   "Charm of the Ancient",
   "Tiny Titan Tree",
   "Helm of Hermes",
   "Fruit of Eden",
   "Influential Elixir",
   "O'Ryan's Charm",
   "Heart of Storms",
   "Apollo Orb",
   "Earrings of Portara",
   "Avian Feather",
   "Corrupted Rune Heart",
   "Durendal Sword",
   "Helheim Skull",
   "Oath's Burden",
   "Crown of the Constellation",
   "Titania's Sceptre",
   "Fagin's Grip",
   "Ring of Calisto",
   "Blade of Damocles",
   "Helmet of Madness",
   "Titanium Plating",
   "Moonlight Bracelet",
   "Amethyst Staff",
   "Sword of the Royals",
   "Spearit's Vigil",
   "The Cobalt Plate",
   "Sigils of Judgement",
   "Foliage of the Keeper",
   "Invader's Gjalarhorn",
   "Titan's Mask",
   "Royal Toxin",
   "Laborer's Pendant",
   "Bringer of Ragnarok",
   "Parchment of Foresight",
   "Elixir of Eden",
   
   ];

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
   
 const tcoef = [
   0.2000,
   0.2143,
   0.2143,
   0.3571,
   0.2500,
   0.2188,
   0.2500,
   0.2500,
   0.3571,
   0.2500,
   0.2500,
   0.2500,
   0.1875,
   0.1875,
   0.2188,
   0.3333,
   0.2222,
   0.2333,
   0.2222,
   0.3333,
   0.2593,
   0.2593,
   0.2593,
   0.2593,
   0.2593,
   0.2593,
   0.2333,
   0.2593,
   0.2500,
   0.2188,
   0.2188,
   0.2222,
   0.2222,
   0.2222,
   0.3333,
   0.3333,
   0.2031,
   0.2031,
   0.2031,
   0.2031,
   0.2031,
   0.2167,
   0.2167,
   0.2167,
   0.2167,
   0.2167,
   0.2188,
   0.2188,
   0.2188,
   0.2188,
   0.2188,
   0.2143,
   0.2222,
   0.2222,
   0.2222,
   0.2222,
   0.2222,
   0.2222
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
  
 const af_cost = [
   1.00E+00,
   4.00E+00,
   1.10E+01,
   2.30E+01,
   4.20E+01,
   7.20E+01,
   1.18E+02,
   1.87E+02,
   2.89E+02,
   4.38E+02,
   6.52E+02,
   9.59E+02,
   1.39E+03,
   2.01E+03,
   2.87E+03,
   4.07E+03,
   5.75E+03,
   8.07E+03,
   1.13E+04,
   1.57E+04,
   2.18E+04,
   3.02E+04,
   4.16E+04,
   5.73E+04,
   7.87E+04,
   1.08E+05,
   1.47E+05,
   2.01E+05,
   2.74E+05,
   3.73E+05,
   5.07E+05,
   6.88E+05,
   9.33E+05,
   1.26E+06,
   1.71E+06,
   2.31E+06,
   3.12E+06,
   4.20E+06,
   5.66E+06,
   7.63E+06,
   1.04E+07,
   1.47E+07,
   2.12E+07,
   3.13E+07,
   4.69E+07,
   7.12E+07,
   1.09E+08,
   1.69E+08,
   2.63E+08,
   4.13E+08,
   6.52E+08,
   1.04E+09,
   1.65E+09,
   2.65E+09,
   4.28E+09,
   6.95E+09,
   1.13E+10,
   1.86E+10,
   3.06E+10,
   5.07E+10,
   8.44E+10,
   1.41E+11,
   2.37E+11,
   4.01E+11,
   6.81E+11,
   4.52E+12,
   5.77E+13,
   7.96E+14,
   1.11E+16,
   1.55E+17,
   2.19E+18,
   3.10E+19,
   4.40E+20,
   6.29E+21,
   9.05E+22,
   1.30E+24,
   1.89E+25,
   2.75E+26,
   4.01E+27,
   5.90E+28,
   8.71E+29,
   1.29E+31,
   1.92E+32,
   3.15E+33,
   4.36E+34,
   6.55E+35,
   9.92E+36,
   1.51E+38,
   2.32E+39,
   3.56E+40,
   5.19E+42,
   8.05E+44,
   1.26E+47,
   1.96E+49,
   3.09E+51
   ];
   
 const damage_bonus = [
   0.3,
   0.2,
   0.2,
   0.4,
   0.4,
   0.3,
   0.3,
   0.3,
   0.4,
   0.5,
   0.3,
   0.3,
   0.2,
   0.2,
   1,
   1,
   0.3,
   0.5,
   0.2,
   1,
   0.5,
   0.3,
   0.3,
   0.3,
   0.3,
   0.3,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.3,
   0.3,
   0.3,
   1,
   1,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.2,
   0.2,
   0.2,
   0.2,
   0.2,
   0.2,
   0.2
   ];   
   
 const cost_coef = [
   0.7,
   0.6,
   0.6,
   1,
   0.7,
   0.7,
   0.7,
   0.7,
   1,
   0.7,
   0.7,
   0.7,
   0.6,
   0.6,
   0.7,
   1,
   0.6,
   0.7,
   0.6,
   1,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.6,
   0.6,
   0.6,
   1,
   1,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.65,
   0.7,
   0.7,
   0.7,
   0.7,
   0.7,
   0.6,
   0.6,
   0.6,
   0.6,
   0.6,
   0.6,
   0.6
   ];

 const cost_expo = [
   2.5,
   1.8,
   1.8,
   1.8,
   1.8,
   2.2,
   1.8,
   1.8,
   1.8,
   1.8,
   1.8,
   1.8,
   2.2,
   2.2,
   2.2,
   2,
   1.7,
   2,
   1.7,
   2,
   1.7,
   1.7,
   1.7,
   1.7,
   1.7,
   1.7,
   2,
   1.7,
   1.8,
   2.2,
   2.2,
   1.7,
   1.7,
   1.7,
   2,
   2,
   2.2,
   2.2,
   2.2,
   2.2,
   2.2,
   2,
   2,
   2,
   2,
   2,
   2.2,
   2.2,
   2.2,
   2.2,
   2.2,
   1.8,
   1.7,
   1.7,
   1.7,
   1.7,
   1.7,
   1.7
   ]
 


 // ページの動作など
 function removeAllChildren(element) {
     while (element.firstChild) { // 子どもの要素があるかぎり削除
       element.removeChild(element.firstChild);
     }
   }




 // 入力後の操作

 optimiseButton.onclick = function() {
   
   var total_relic = relicInput.value;
   var bos_percent = bosInput.value;
   const afcost = Number(afcInput.value);

   const build = buildInput.value;
   const gold = goldInput.value;
   const hero1 = hero1Input.value;
   const hero2 = hero2Input.value;
    
   
    if (total_relic.length === 0 || bos_percent.length === 0) { // 入力が空の時は処理を終了する
      alert("入力が不十分です");
      return;
    }
  
  var rt1 = total_relic; 
  var relican = 0;
  
  // レター入力⇒指数変換(レリック)
  // {
    if(String(total_relic).slice(-2) == "aa"){relican = Number(total_relic.slice(0, -2)+'e15')}
    if(String(total_relic).slice(-2) == "ab"){relican = Number(total_relic.slice(0, -2)+'e18')}
    if(String(total_relic).slice(-2) == "ac"){relican = Number(total_relic.slice(0, -2)+'e21')}
    if(String(total_relic).slice(-2) == "ad"){relican = Number(total_relic.slice(0, -2)+'e24')}
    if(String(total_relic).slice(-2) == "ae"){relican = Number(total_relic.slice(0, -2)+'e27')}
    if(String(total_relic).slice(-2) == "af"){relican = Number(total_relic.slice(0, -2)+'e30')}
    if(String(total_relic).slice(-2) == "ag"){relican = Number(total_relic.slice(0, -2)+'e33')}
    if(String(total_relic).slice(-2) == "ah"){relican = Number(total_relic.slice(0, -2)+'e36')}
    if(String(total_relic).slice(-2) == "ai"){relican = Number(total_relic.slice(0, -2)+'e39')}
    if(String(total_relic).slice(-2) == "aj"){relican = Number(total_relic.slice(0, -2)+'e42')}
    if(String(total_relic).slice(-2) == "ak"){relican = Number(total_relic.slice(0, -2)+'e45')}
    if(String(total_relic).slice(-2) == "al"){relican = Number(total_relic.slice(0, -2)+'e48')}
    if(String(total_relic).slice(-2) == "am"){relican = Number(total_relic.slice(0, -2)+'e51')}
    if(String(total_relic).slice(-2) == "an"){relican = Number(total_relic.slice(0, -2)+'e54')}
    if(String(total_relic).slice(-2) == "ao"){relican = Number(total_relic.slice(0, -2)+'e57')}
    if(String(total_relic).slice(-2) == "ap"){relican = Number(total_relic.slice(0, -2)+'e60')}
    if(String(total_relic).slice(-2) == "aq"){relican = Number(total_relic.slice(0, -2)+'e63')}
    if(String(total_relic).slice(-2) == "ar"){relican = Number(total_relic.slice(0, -2)+'e66')}
    if(String(total_relic).slice(-2) == "as"){relican = Number(total_relic.slice(0, -2)+'e69')}
    if(String(total_relic).slice(-2) == "at"){relican = Number(total_relic.slice(0, -2)+'e72')}
    if(String(total_relic).slice(-2) == "au"){relican = Number(total_relic.slice(0, -2)+'e75')}
    if(String(total_relic).slice(-2) == "av"){relican = Number(total_relic.slice(0, -2)+'e78')}
    if(String(total_relic).slice(-2) == "aw"){relican = Number(total_relic.slice(0, -2)+'e81')}
    if(String(total_relic).slice(-2) == "ax"){relican = Number(total_relic.slice(0, -2)+'e84')}
    if(String(total_relic).slice(-2) == "ay"){relican = Number(total_relic.slice(0, -2)+'e87')}
    if(String(total_relic).slice(-2) == "az"){relican = Number(total_relic.slice(0, -2)+'e90')}
    if(String(total_relic).slice(-2) == "ba"){relican = Number(total_relic.slice(0, -2)+'e93')}
    if(String(total_relic).slice(-2) == "bb"){relican = Number(total_relic.slice(0, -2)+'e96')}
    if(String(total_relic).slice(-2) == "bc"){relican = Number(total_relic.slice(0, -2)+'e99')}
    if(String(total_relic).slice(-2) == "bd"){relican = Number(total_relic.slice(0, -2)+'e102')}
    if(String(total_relic).slice(-2) == "be"){relican = Number(total_relic.slice(0, -2)+'e105')}
    if(String(total_relic).slice(-2) == "bf"){relican = Number(total_relic.slice(0, -2)+'e108')}
    if(String(total_relic).slice(-2) == "bg"){relican = Number(total_relic.slice(0, -2)+'e111')}
    if(String(total_relic).slice(-2) == "bh"){relican = Number(total_relic.slice(0, -2)+'e114')}
    if(String(total_relic).slice(-2) == "bi"){relican = Number(total_relic.slice(0, -2)+'e117')}
    if(String(total_relic).slice(-2) == "bj"){relican = Number(total_relic.slice(0, -2)+'e120')}
    if(String(total_relic).slice(-2) == "bk"){relican = Number(total_relic.slice(0, -2)+'e123')}
    if(String(total_relic).slice(-2) == "bl"){relican = Number(total_relic.slice(0, -2)+'e126')}
    
    
  //}
  
  // 入力レリックのKMBT変換
  // {
  
  function henkanK(string){
      var number = Number(string);
    return number *1000;
  }
  
  function henkanM(string){
    var number = Number(string);
    return number *1000000;
  }
  
  function henkanB(string){
    var number = Number(string);
    return number *1000000000;
  }
  
  function henkanT(string){
    var number = Number(string);
    return number *1000000000000;
  }
  
  
  function search(string){

    if (string.slice(-1)=='K'){return henkanK(string.slice(0, -1));}
    if (string.slice(-1)=='M'){ return henkanM(string.slice(0, -1));}
    if (string.slice(-1)=='B'){ return henkanB(string.slice(0, -1));}
    if (string.slice(-1)=='T'){ return henkanT(string.slice(0, -1));}
    return Number(string);
  }
   
   if (relican == 0) relican = search(total_relic); 
   
  //} 
  
  
  
  // 入力BOSのレター⇒e変換
  // {
    if(String(bos_percent).slice(-2) == "aa"){bos_percent = Number(bos_percent.slice(0, -2)+'e15')}
    if(String(bos_percent).slice(-2) == "ab"){bos_percent = Number(bos_percent.slice(0, -2)+'e18')}
    if(String(bos_percent).slice(-2) == "ac"){bos_percent = Number(bos_percent.slice(0, -2)+'e21')}
    if(String(bos_percent).slice(-2) == "ad"){bos_percent = Number(bos_percent.slice(0, -2)+'e24')}
    if(String(bos_percent).slice(-2) == "ae"){bos_percent = Number(bos_percent.slice(0, -2)+'e27')}
    if(String(bos_percent).slice(-2) == "af"){bos_percent = Number(bos_percent.slice(0, -2)+'e30')}
    if(String(bos_percent).slice(-2) == "ag"){bos_percent = Number(bos_percent.slice(0, -2)+'e33')}
    if(String(bos_percent).slice(-2) == "ah"){bos_percent = Number(bos_percent.slice(0, -2)+'e36')}
    if(String(bos_percent).slice(-2) == "ai"){bos_percent = Number(bos_percent.slice(0, -2)+'e39')}
    if(String(bos_percent).slice(-2) == "aj"){bos_percent = Number(bos_percent.slice(0, -2)+'e42')}
    if(String(bos_percent).slice(-2) == "ak"){bos_percent = Number(bos_percent.slice(0, -2)+'e45')}
    if(String(bos_percent).slice(-2) == "al"){bos_percent = Number(bos_percent.slice(0, -2)+'e48')}
    if(String(bos_percent).slice(-2) == "am"){bos_percent = Number(bos_percent.slice(0, -2)+'e51')}
    if(String(bos_percent).slice(-2) == "an"){bos_percent = Number(bos_percent.slice(0, -2)+'e54')}
    if(String(bos_percent).slice(-2) == "ao"){bos_percent = Number(bos_percent.slice(0, -2)+'e57')}
    if(String(bos_percent).slice(-2) == "ap"){bos_percent = Number(bos_percent.slice(0, -2)+'e60')}
    if(String(bos_percent).slice(-2) == "aq"){bos_percent = Number(bos_percent.slice(0, -2)+'e63')}
    if(String(bos_percent).slice(-2) == "ar"){bos_percent = Number(bos_percent.slice(0, -2)+'e66')}
    if(String(bos_percent).slice(-2) == "as"){bos_percent = Number(bos_percent.slice(0, -2)+'e69')}
    if(String(bos_percent).slice(-2) == "at"){bos_percent = Number(bos_percent.slice(0, -2)+'e72')}
    if(String(bos_percent).slice(-2) == "au"){bos_percent = Number(bos_percent.slice(0, -2)+'e75')}
    if(String(bos_percent).slice(-2) == "av"){bos_percent = Number(bos_percent.slice(0, -2)+'e78')}
    if(String(bos_percent).slice(-2) == "aw"){bos_percent = Number(bos_percent.slice(0, -2)+'e81')}
    if(String(bos_percent).slice(-2) == "ax"){bos_percent = Number(bos_percent.slice(0, -2)+'e84')}
    if(String(bos_percent).slice(-2) == "ay"){bos_percent = Number(bos_percent.slice(0, -2)+'e87')}
    if(String(bos_percent).slice(-2) == "az"){bos_percent = Number(bos_percent.slice(0, -2)+'e90')}
    if(String(bos_percent).slice(-2) == "ba"){bos_percent = Number(bos_percent.slice(0, -2)+'e93')}
    if(String(bos_percent).slice(-2) == "bb"){bos_percent = Number(bos_percent.slice(0, -2)+'e96')}
    if(String(bos_percent).slice(-2) == "bc"){bos_percent = Number(bos_percent.slice(0, -2)+'e99')}
    if(String(bos_percent).slice(-2) == "bd"){bos_percent = Number(bos_percent.slice(0, -2)+'e102')}
    if(String(bos_percent).slice(-2) == "be"){bos_percent = Number(bos_percent.slice(0, -2)+'e105')}
    if(String(bos_percent).slice(-2) == "bf"){bos_percent = Number(bos_percent.slice(0, -2)+'e108')}
    if(String(bos_percent).slice(-2) == "bg"){bos_percent = Number(bos_percent.slice(0, -2)+'e111')}
    if(String(bos_percent).slice(-2) == "bh"){bos_percent = Number(bos_percent.slice(0, -2)+'e114')}
    if(String(bos_percent).slice(-2) == "bi"){bos_percent = Number(bos_percent.slice(0, -2)+'e117')}
    if(String(bos_percent).slice(-2) == "bj"){bos_percent = Number(bos_percent.slice(0, -2)+'e120')}
    if(String(bos_percent).slice(-2) == "bk"){bos_percent = Number(bos_percent.slice(0, -2)+'e123')}
    if(String(bos_percent).slice(-2) == "bl"){bos_percent = Number(bos_percent.slice(0, -2)+'e126')}
  //}
  
  // 入力BOSのKMBT変換
  // {
     if (typeof(bos_percent) == typeof(build)){bos_percent = search(bos_percent)}
  //}

  if (typeof(relican) == typeof(build)){relican = Number(total_relic)}
  
  
  
  
  // 影率計算 {
  if (bos_percent > 1){
    bos_percent = bos_percent / relican;
  }
  //}
    
  // 選択要素を配置{
 
 var buildv = [0,0,0,0]; // SC,PET,CS,HS
 var goldv  = [0,0,0]; // フェア,phom,チェスた
 var hero1v = [0,0]; // 地面,飛行
 var hero2v = [0,0,0]; // 近・遠・魔
  
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
 //}
 
 
  // リダクション計算
  // {
 var r = []; // reduction
  r[0]  = 0; //bos
  r[1]  = 0.79; // CCa
  r[2]  = 0.79*4; // SotV
  r[3]  = 0.79*(goldv[0]+goldv[2]); //CoC
  r[4]  = 0.79*(goldv[1]); //HSh
  r[5]  = 0.79; // BoP
  r[6]  = 0.79; // KB
  r[7]  = 0; //ZC
  r[8]  = 0.79*(goldv[0]); //GDM
  r[9]  = 0.79*(goldv[1]); //NS
  r[10] = 0.79*(goldv[2]); //CoE
  r[11] = 0.79*(goldv[0]+goldv[1]); //TBC
  r[12] = 1; // ES
  r[13] = 4; // FotS
  r[14] = 1; //HSw
  r[15] = 1; //DR
  r[16] = 0.6*buildv[0]+(buildv[1]+buildv[3]); //DH
  r[17] = 0.6*buildv[0]+0.8*buildv[3]; //SS
  r[18] = 1; //Ret
  r[19] = 0.6*buildv[0]+(buildv[1]+buildv[3]) + 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]; //SP
  r[20] = 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]; //HB
  r[21] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[0]; // TSoS
  r[22] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[1]; // FB
  r[23] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[2]; //CotA
  r[24] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[0]; //TTI
  r[25] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[1]; //HoH
  r[26] = buildv[1]; //FoE
  r[27] = buildv[2]; //IE
  r[28] = buildv[1]+buildv[0]+buildv[2]; //ORC
  r[29] = 4*(0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])+2*(0.6*buildv[0]+(buildv[1]+buildv[3]))+2; //HoS
  r[30] = 0.79*2; //AO
  r[31] = 1; //EoP
  r[32] = 0; //AF
  r[33] = 0; // CRH
  r[34] = 0; //DSw
  r[35] = 1; //HSk
  r[36] = 2*(0.6*buildv[0]+(buildv[1]+buildv[3]))+(buildv[1]); //OB
  r[37] = 2*(0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])+(buildv[2]); //CotC
  r[38] = (buildv[3])+((0.6*0.79)*(goldv[1]+goldv[0]+goldv[2]))+(buildv[0]); //TSc
  r[39] = (0.79*(goldv[0]))+(0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]);//FG
  r[40] = (1)+(Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]))+(0.79)+(Math.max(1, Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])))+(1); //RoC
  r[41] = 1; //BoD
  r[42] = Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]); // HoM
  r[43] = 0.79; //TP
  r[44] = Math.max(1, Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])); //MB
  r[45] = 1;//AS
  r[46] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[0]+1; //SotR
  r[47] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[1]+Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]); //SV
  r[48] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[0]+0.79; //TCP
  r[49] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[2]+Math.max(1, Math.max(0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])); //SoJ
  r[50] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[1]+1; //FotK
  r[51] = buildv[3]+0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]+(0.6*0.79)*(goldv[1]+goldv[0]+goldv[2])+0.6*buildv[0]+(buildv[1]+buildv[3])+0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]+buildv[0]; //IG
  r[52] = buildv[3]; //TM
  r[53] = 0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]; //RT
  r[54] = (0.6*0.79)*(goldv[1]+goldv[0]+goldv[2]); //LP
  r[55] = 0.6*buildv[0]+(buildv[1]+buildv[3]); //BoR
  r[56] = 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]; //PoF
  r[57] = buildv[0]; //EoE
  //}
  
 
  
  
  // 未所持AF選択
  var c =[];
  for (var i = 0; i < 58; i++) {
    var ut = "afhave"+i;
    // i番目のチェックボックスがチェックされているかを判定
    if (document.getElementById(ut).checked) {
      c[i] = 0;
    } else {
      c[i] = 1;
    }
  }
  
  
  
  
  // 主な計算
  var AD = 0;
  if (document.getElementById("AD").checked){AD=1;}
  var ADstuff =[];
  for (var i=0; i<r.length; i++){
    ADstuff[i] = (Math.pow((Math.pow(damage_bonus[i],1.24)*cost_coef[i]/cost_expo[i]),texpo[i]))*AD*c[i];
  }
  
  var costweight = [];
  for (var i=0; i<r.length; i++){
    costweight[i] = ((effectWeight[i]*growthExpo[i]*r[i]*c[i])/texpo[i])+ADstuff[i];
  }
  
  var costweight_sum = 0;
  for (var i=0; i<r.length; i++){
    costweight_sum += costweight[i];
  }
  
  var cost_percent = [];
  for (var i=0; i<r.length; i++){
    cost_percent[i] = costweight[i]/costweight_sum;
  }

  relican -= af_cost[afcost-1];
  
  var ideal_relic = [];
  ideal_relic[0] = relican * bos_percent;
  
  var relic_other_bos = relican - ideal_relic[0];
  
  for (var i=1; i<r.length; i++){
    ideal_relic[i] = cost_percent[i] * relic_other_bos;
  }
  
  var Estlvl = [];
  for (var i=0; i<r.length; i++){
    Estlvl[i] = Math.pow((ideal_relic[i]/tcoef[i]), (1/texpo[i]));
  }
  
  var RoundLv = [];
  for (var i=0; i<r.length; i++){
    var num = Estlvl[i];
    RoundLv[i] = num.toExponential(1);
  }
  
  afname[0]= "Book of Shadows (" + String(((bos_percent)*100).toFixed(1)) + "%)";
  
  
  
  // RoundLVのe⇒KMBT変換{
  
  function henkan1(string){
    var num = Number(string);
    return Math.round(num *10);
  }
  
  function henkan2(string){
    var num = Number(string);
    return Math.round(num *100);
  }
  
  function henkan3(string){
    return string+'K';
  }
  
  function henkan4(string){
    var num = Number(string);
    return Math.round(num*10)+'K';
  }
  
  function henkan5(string){
    var num = Number(string);
    return Math.round(num*100)+'K';
  }
  
  function henkan6(string){
    return string+'M';
  }
  
  function henkan7(string){
    var num = Number(string);
    return Math.round(num*10)+'M';
  }
  
  function henkan8(string){
   var num = Number(string);
    return Math.round(num*100)+'M';
  }
  
   function henkan9(string){
    return string+'B';
  }
  
  function henkan10(string){
    var num = Number(string);
    return Math.round(num*10)+'B';
  }
  
  function henkan11(string){
   var num = Number(string);
    return Math.round(num*100)+'B';
  }
  
   function henkan12(string){
    return string+'T';
  }
  
  function henkan13(string){
    var num = Number(string);
    return Math.round(num*10)+'T';
  }
  
  function henkan14(string){
   var num = Number(string);
    return Math.round(num*100)+'T';
  }
  
  
  function search2(string) {
  for (var i=0; i<r.length; i++){
  if(string.slice(-2) == "+0"){return Math.round(Number(string.slice(0, -3)));}
  if(string.slice(-2) == "+1"){return henkan1(string.slice(0, -3));}
  if(string.slice(-2) == "+2"){return henkan2(string.slice(0, -3));}
  if(string.slice(-2) == "+3"){return henkan3(string.slice(0, -3));}
  if(string.slice(-2) == "+4"){return henkan4(string.slice(0, -3));}
  if(string.slice(-2) == "+5"){return henkan5(string.slice(0, -3));}
  if(string.slice(-2) == "+6"){return henkan6(string.slice(0, -3));}
  if(string.slice(-2) == "+7"){return henkan7(string.slice(0, -3));}
  if(string.slice(-2) == "+8"){return henkan8(string.slice(0, -3));}
  if(string.slice(-2) == "+9"){return henkan9(string.slice(0, -3));}
  if(string.slice(-3) == "+10"){return henkan10(string.slice(0, -4));}
  if(string.slice(-3) == "+11"){return henkan11(string.slice(0, -4));}
  if(string.slice(-3) == "+12"){return henkan12(string.slice(0, -4));}
  if(string.slice(-3) == "+13"){return henkan13(string.slice(0, -4));}
  if(string.slice(-3) == "+14"){return henkan14(string.slice(0, -4));}
  
  }
  return Number(string).toExponential(1);
  }
 
  for (var i=0; i<r.length; i++){
    RoundLv[i] = search2(RoundLv[i]);
  }
  
  //}
  
  // RoundLvのe⇒レター変換{
    var letter = [0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    'aa',
    'aa',
    'aa',
    'ab',
    'ab',
    'ab',
    'ac',
    'ac',
    'ac',
    'ad',
    'ad',
    'ad',
    'ae',
    'ae',
    'ae',
    'af',
    'af',
    'af',
    'ag',
    'ag',
    'ag',
    'ah',
    'ah',
    'ah',
    'ai',
    'ai',
    'ai',
    'aj',
    'aj',
    'aj',
    'ak',
    'ak',
    'ak',
    'al',
    'al',
    'al',
    'am',
    'am',
    'am',
    'an',
    'an',
    'an',
    'ao',
    'ao',
    'ao',
    'ap',
    'ap',
    'ap',
    'aq',
    'aq',
    'aq',
    'ar',
    'ar',
    'ar',
    'as',
    'as',
    'as',
    'at',
    'at',
    'at',
    'au',
    'au',
    'au',
    'av',
    'av',
    'av',
    'aw',
    'aw',
    'aw',
    'ax',
    'ax',
    'ax',
    'ay',
    'ay',
    'ay',
    'az',
    'az',
    'az',
    'ba',
    'ba',
    'ba',
    'bb',
    'bb',
    'bb',
    'bc',
    'bc',
    'bc',
    'bd',
    'bd',
    'bd',
    'be',
    'be',
    'be',
    'bf',
    'bf',
    'bf',
    'bg',
    'bg',
    'bg',
    'bh',
    'bh',
    'bh',
    'bi',
    'bi',
    'bi',
    'bj',
    'bj',
    'bj',
    'bk',
    'bk',
    'bk',
    'bl',
    'bl',
    'bl',
    'bm',
    'bm',
    'bm',
    ];
  
  

  if (document.getElementById("letter").checked) {
    for (var i=0; i<r.length; i++){
    
    var sisuu = Number(String(RoundLv[i]).slice(5)) ;
    if(sisuu > 14){
    var cof;
    if(sisuu % 3 == 0){cof = String(Estlvl[i]).slice(0, 1);}
    if(sisuu % 3 == 1){cof = String(Estlvl[i]).replace(".","").slice(0, 2);}
     if(sisuu % 3 == 2){cof = String(Estlvl[i]).replace(".","").slice(0, 3);}
    
    RoundLv[i] = cof + letter[sisuu];
       
      }}
    
  }
  
  //}
  
  
  
    
  // 結果表示エリア
    removeAllChildren(resultDivided);
    const header = document.createElement('h3');
    header.innerText = '結果';
    resultDivided.appendChild(header);
    
    for (var i=0; i<r.length; i++){
    var output = "af"+i;
    var target = document.getElementById(output);
    target.innerText = RoundLv[i];
    var af = "output"+i;
    var target2 = document.getElementById(af);
    target2.innerText = afname[i];
    }
    
  
  };

};