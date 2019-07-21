module StaticPagesHelper
  
  def ischeck(x)
    x == "1" ? true : false
  end
  
  def ischeck2(x,s)
    x == s ? true : false
  end
  
  def image_name(x)
    afname = [
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
   ]
   afname[x].gsub(/ /, "_") 
  end
  
  
  # 計算
  
  def keisan
    
    # 入力処理
    input_proc 
    
    # 影率計算
    bos_proc
    
    # 各定数のinport
    data
    
    # リダクション処理
    reduction
    
    # 未所持AF処理
    af_proc
    
    #主計算
    ad_proc
    costweight_sum = 0
    costweight = []
    (0..@r.size()-1).each do |i|
      costweight[i] = ((@effectWeight[i]*
      @growthExpo[i]*
      @r[i]*@c[i])/@texpo[i])+
      @ad_stuff[i]
      costweight_sum += costweight[i]
    end
    
    cost_percent = []
    (0..@r.size()-1).each do |i|
      cost_percent[i] = costweight[i]/costweight_sum;
    end
    @relican -= @af_cost[(@afcost.to_i)-1]
    ideal_relic = []
    ideal_relic[0] = @relican * @bos_percent
    relic_other_bos = @relican - ideal_relic[0]
    
    (1..@r.size()-1).each do |i|
      ideal_relic[i] = cost_percent[i] * relic_other_bos
    end
    
    @est_lvl = []
    (0..@r.size()-1).each do |i|
      @est_lvl[i] = ((ideal_relic[i]/@tcoef[i]) ** (1/@texpo[i]))
    end
    
    #文字列で返す
    @round_lvl = []
    (0..@r.size()-1).each do |i|
      @round_lvl[i] = e_round(@est_lvl[i])
    end
    
    
    #出力処理
    @afname[0] = "Book of Shadows (" + ((@bos_percent*100).round(1)).to_s + "%)"
    output_proc
    
    
  end
  
  def output_proc
    # round_lvl の e => KMBT変換
    (0..57).each do |i|
      @round_lvl[i] = search2(@round_lvl[i])
    end
    
    if @letter == "1"
      (0..@r.size()-1).each do |i|
        if e_round(@est_lvl[i]).include?("e")
          sisuu = (e_round(@est_lvl[i]).slice!(/\d*$/)).to_i
          if sisuu > 14
            cof = e_round(@est_lvl[i]).slice(0,3) if sisuu % 3 == 0
            cof = e_round(@est_lvl[i]).delete(".").slice(0,2) if sisuu % 3 == 1
            cof = e_round(@est_lvl[i]).delete(".").slice(0,3) if sisuu % 3 == 2
            @round_lvl[i] = cof + @letter_data[sisuu]
          end
        end
      end
      
    end
  end
  
  
  
  def e_round(x)
    return "0" if x == 0
    return x.round.to_s if x < 1000
    x = x.round
    ans = (x.to_s.slice(0))+'.'+(x.to_s.slice(1,2))+'e'+((((x.to_s.size()).to_i)-1)).to_s
    return ans
  end
  
  def ad_proc
    ad = 0
    ad = 1 if @ad == "1"
      @ad_stuff = []
      (0..@r.size()-1).each do |i|
        @ad_stuff[i] = (((@damage_bonus[i] ** 1.24) * @cost_coef[i] / @cost_expo[i]) **
        @texpo[i])*
        @c[i]*
        ad
      end
    
  end
  
  def af_proc
    @c = []
    (0..57).each do |i|
      @c[i] = 0 if @af[i] == "1"
      @c[i] = 1 if @af[i] == "0"
    end
  end
  
  def data
    @parrot_coef = [
        0.05,
        0.02,
        0.01,
        0.25,
        0.25,
        0.25,
        0.04,
        0.6,
        0.3,
        0.3,
        0.2,
        0.04,
        0.02,
        0.01,
        0.05,
        0.1,
        0.1,
        0.2,
        0.1,
        0.04,
        0.15,
        0.2,
        0.2,
        0.2,
        0.2,
        0.2,
        0.1,
        0.1,
        0.1,
        0.005,
        0.02,
        0.03,
        0.5,
        0.00025,
        0.24,
        0.12,
        0.02,
        0.02,
        0.02,
        0.02,
        0.01,
        0.08,
        0.08,
        0.08,
        0.08,
        0.08,
        0.02,
        0.02,
        0.02,
        0.02,
        0.02,
        0.02,
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
        0.1]  
    
    @letter_data_uni = [
    'aa',
    'ab',
    'ac',
    'ad',
    'ae',
    'af',
    'ag',
    'ah',
    'ai',
    'aj',
    'ak',
    'al',
    'am',
    'an',
    'ao',
    'ap',
    'aq',
    'ar',
    'as',
    'at',
    'au',
    'av',
    'aw',
    'ax',
    'ay',
    'az',
    'ba',
    'bb',
    'bc',
    'bd',
    'be',
    'bf',
    'bg',
    'bh',
    'bi',
    'bj',
    'bk',
    'bl',
    'bm' ]
    
   @letter_data = [0,
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
    ]
    
   @afname = [
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
   
   ]

   @growthExpo =[
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
   
   @texpo = [
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
   
   @tcoef = [
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
  
   @effectWeight = [
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
  
   @af_cost = [
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
     3.09E+51,
     4.89E+53,
     7.77E+55,
     1.24E+58
   ]
   
   @damage_bonus = [
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
   
   @cost_coef = [
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

   @cost_expo = [
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
  end
  
  def bos_proc
    @bos_percent = (@bos_percent / @relican) if @bos_percent > 1 
  end
  
  def reduction
    buildv = [0,0,0,0]  #SC,PET,CS,HS
    goldv  = [0,0,0]    #フェア,phom,チェスた
    hero1v = [0,0]      #地面,飛行
    hero2v = [0,0,0]    #近・遠・魔
    
    buildv[0] = 1 if @build == "SC"
    buildv[1] = 1 if @build == "PET"
    buildv[2] = 1 if @build == "CS"
    buildv[3] = 1 if @build == "HS"
    
    goldv[0] = 1 if @gold == "フェアリー"
    goldv[1] = 1 if @gold == "pHoM"
    goldv[2] = 1 if @gold == "チェスターソン"
 
    hero1v[0] = 1 if @hero1 == "地面"
    hero1v[1] = 1 if @hero1 == "飛行"
 
    hero2v[0] = 1 if @hero2 == "近接"
    hero2v[1] = 1 if @hero2 == "遠隔" 
    hero2v[2] = 1 if @hero2 == "魔術" 
    
    @r = []
    @r[0]  = 0 #bos
    @r[1]  = 0.79 #CCa
    @r[2]  = 0.79*4 #SotV
    @r[3]  = 0.79*(goldv[0]+goldv[2]) #CoC
    @r[4]  = 0.79*(goldv[1]) #HSh
    @r[5]  = 0.79 # BoP
    @r[6]  = 0.79 #KB
    @r[7]  = 0 #ZC
    @r[8]  = 0.79*(goldv[0]) #GDM
    @r[9]  = 0.79*(goldv[1]) #NS
    @r[10] = 0.79*(goldv[2]) #CoE
    @r[11] = 0.79*(goldv[0]+goldv[1]) #TBC
    @r[12] = 1 # ES
    @r[13] = 4 #FotS
    @r[14] = 1 #HSw
    @r[15] = 1 #DR
    @r[16] = 0.6*buildv[0]+(buildv[1]+buildv[3]) #DH
    @r[17] = 0.6*buildv[0]+0.8*buildv[3] #SS
    @r[18] = 1 #Ret
    @r[19] = 0.6*buildv[0]+(buildv[1]+buildv[3]) + 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2] #SP
    @r[20] = 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2] #HB
    @r[21] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[0] #TSoS
    @r[22] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[1] # FB
    @r[23] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[2] #CotA
    @r[24] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[0] #TTI
    @r[25] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[1] #HoH
    @r[26] = buildv[1] #FoE
    @r[27] = buildv[2] #IE
    @r[28] = buildv[1]+buildv[0]+buildv[2] #ORC
    @r[29] = 4*(0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])+2*(0.6*buildv[0]+(buildv[1]+buildv[3]))+2 #HoS
    @r[30] = 0.79*2 #AO
    @r[31] = 1 #EoP
    @r[32] = 0 #AF
    @r[33] = 0 #CRH
    @r[34] = 0 #DSw
    @r[35] = 1 #HSk
    @r[36] = 2*(0.6*buildv[0]+(buildv[1]+buildv[3]))+(buildv[1]) #OB
    @r[37] = 2*(0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])+(buildv[2]) #CotC
    @r[38] = (buildv[3])+((0.6*0.79)*(goldv[1]+goldv[0]+goldv[2]))+(buildv[0]) #TSc
    @r[39] = (0.79*(goldv[0]))+(0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]) #FG
    @r[40] = (1)+ ([0.6*buildv[0]+ 0.8*buildv[3],0.6*buildv[0]+ 0.5*(buildv[1]+buildv[3])+buildv[2]].max)+(0.79)+ ([1,([0.6*buildv[0]+ 0.8*buildv[3], 0.6*buildv[0]+ 0.5*(buildv[1]+buildv[3])+ buildv[2] ].max) ].max) +(1) #RoC
    @r[41] = 1 #BoD
    @r[42] = [0.6*buildv[0]+ 0.8*buildv[3], 0.6*buildv[0]+ 0.5*(buildv[1]+buildv[3])+buildv[2]].max # HoM
    @r[43] = 0.79 #TP
    @r[44] = [1, [0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]].max ].max #MB
    @r[45] = 1 #AS
    @r[46] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[0]+1 #SotR
    @r[47] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[1]+[0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]].max #SV
    @r[48] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero1v[0]+0.79 #TCP
    @r[49] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[2]+[1, [0.6*buildv[0]+0.8*buildv[3],0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]].max].max #SoJ
    @r[50] = (0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2])*hero2v[1]+1 #FotK
    @r[51] = buildv[3]+0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1]+(0.6*0.79)*(goldv[1]+goldv[0]+goldv[2])+0.6*buildv[0]+(buildv[1]+buildv[3])+0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2]+buildv[0] #IG
    @r[52] = buildv[3] #TM
    @r[53] = 0.6*buildv[0]+0.5*buildv[2]+0.7*buildv[1] #RT
    @r[54] = (0.6*0.79)*(goldv[1]+goldv[0]+goldv[2]) #LP
    @r[55] = 0.6*buildv[0]+(buildv[1]+buildv[3]) #BoR
    @r[56] = 0.6*buildv[0]+0.5*(buildv[1]+buildv[3])+buildv[2] #PoF
    @r[57] = buildv[0] #EoE
  end
  
  def bos_eff_to_relic # 数字でリターン
    @bos_percent = 0.2 * (@bos_percent) ** 3.5
  end
  
  def input_proc
    @relican = 0
    
    # str => i (case: letter)
    relic_letter_e 
    
    # str => i (case: KMBT, normal)
    @relican = search(@total_relic) if @relican == 0 
    
    bos_letter_e
    
    @bos_percent = search(@bos_percent) if @bos_percent.class == String
    
    bos_eff_to_relic if @effcheck == "1"
  end  
  
  def relic_letter_e
    @relican = (@total_relic.slice(/\d+/)+'e15').to_f if @total_relic.include?("aa")
    @relican = (@total_relic.slice(/\d+/)+'e18').to_f if @total_relic.include?("ab")
    @relican = (@total_relic.slice(/\d+/)+'e21').to_f if @total_relic.include?("ac")
    @relican = (@total_relic.slice(/\d+/)+'e24').to_f if @total_relic.include?("ad")
    @relican = (@total_relic.slice(/\d+/)+'e27').to_f if @total_relic.include?("ae")
    @relican = (@total_relic.slice(/\d+/)+'e30').to_f if @total_relic.include?("af")
    @relican = (@total_relic.slice(/\d+/)+'e33').to_f if @total_relic.include?("ag")
    @relican = (@total_relic.slice(/\d+/)+'e36').to_f if @total_relic.include?("ah")
    @relican = (@total_relic.slice(/\d+/)+'e39').to_f if @total_relic.include?("ai")
    @relican = (@total_relic.slice(/\d+/)+'e42').to_f if @total_relic.include?("aj")
    @relican = (@total_relic.slice(/\d+/)+'e45').to_f if @total_relic.include?("ak")
    @relican = (@total_relic.slice(/\d+/)+'e48').to_f if @total_relic.include?("al")
    @relican = (@total_relic.slice(/\d+/)+'e51').to_f if @total_relic.include?("am")
    @relican = (@total_relic.slice(/\d+/)+'e54').to_f if @total_relic.include?("an")
    @relican = (@total_relic.slice(/\d+/)+'e57').to_f if @total_relic.include?("ao")
    @relican = (@total_relic.slice(/\d+/)+'e60').to_f if @total_relic.include?("ap")
    @relican = (@total_relic.slice(/\d+/)+'e63').to_f if @total_relic.include?("aq")
    @relican = (@total_relic.slice(/\d+/)+'e66').to_f if @total_relic.include?("ar")
    @relican = (@total_relic.slice(/\d+/)+'e69').to_f if @total_relic.include?("as")
    @relican = (@total_relic.slice(/\d+/)+'e72').to_f if @total_relic.include?("at")
    @relican = (@total_relic.slice(/\d+/)+'e75').to_f if @total_relic.include?("au")
    @relican = (@total_relic.slice(/\d+/)+'e78').to_f if @total_relic.include?("av")
    @relican = (@total_relic.slice(/\d+/)+'e81').to_f if @total_relic.include?("aw")
    @relican = (@total_relic.slice(/\d+/)+'e84').to_f if @total_relic.include?("ax")
    @relican = (@total_relic.slice(/\d+/)+'e87').to_f if @total_relic.include?("ay")
    @relican = (@total_relic.slice(/\d+/)+'e90').to_f if @total_relic.include?("az")
    @relican = (@total_relic.slice(/\d+/)+'e93').to_f if @total_relic.include?("ba")
    @relican = (@total_relic.slice(/\d+/)+'e96').to_f if @total_relic.include?("bb")
    @relican = (@total_relic.slice(/\d+/)+'e99').to_f if @total_relic.include?("bc")
    @relican = (@total_relic.slice(/\d+/)+'e102').to_f if @total_relic.include?("bd")
    @relican = (@total_relic.slice(/\d+/)+'e105').to_f if @total_relic.include?("be")
    @relican = (@total_relic.slice(/\d+/)+'e108').to_f if @total_relic.include?("bf")
    @relican = (@total_relic.slice(/\d+/)+'e111').to_f if @total_relic.include?("bg")
    @relican = (@total_relic.slice(/\d+/)+'e114').to_f if @total_relic.include?("bh")
    @relican = (@total_relic.slice(/\d+/)+'e117').to_f if @total_relic.include?("bi")
    @relican = (@total_relic.slice(/\d+/)+'e120').to_f if @total_relic.include?("bj")
    @relican = (@total_relic.slice(/\d+/)+'e123').to_f if @total_relic.include?("bk")
    @relican = (@total_relic.slice(/\d+/)+'e126').to_f if @total_relic.include?("bl")
  end  
  
  def bos_letter_e
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e15').to_f if @bos_percent.include?("aa")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e18').to_f if @bos_percent.include?("ab")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e21').to_f if @bos_percent.include?("ac")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e24').to_f if @bos_percent.include?("ad")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e27').to_f if @bos_percent.include?("ae")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e30').to_f if @bos_percent.include?("af")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e33').to_f if @bos_percent.include?("ag")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e36').to_f if @bos_percent.include?("ah")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e39').to_f if @bos_percent.include?("ai")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e42').to_f if @bos_percent.include?("aj")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e45').to_f if @bos_percent.include?("ak")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e48').to_f if @bos_percent.include?("al")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e51').to_f if @bos_percent.include?("am")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e54').to_f if @bos_percent.include?("an")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e57').to_f if @bos_percent.include?("ao")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e60').to_f if @bos_percent.include?("ap")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e63').to_f if @bos_percent.include?("aq")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e66').to_f if @bos_percent.include?("ar")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e69').to_f if @bos_percent.include?("as")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e72').to_f if @bos_percent.include?("at")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e75').to_f if @bos_percent.include?("au")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e78').to_f if @bos_percent.include?("av")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e81').to_f if @bos_percent.include?("aw")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e84').to_f if @bos_percent.include?("ax")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e87').to_f if @bos_percent.include?("ay")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e90').to_f if @bos_percent.include?("az")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e93').to_f if @bos_percent.include?("ba")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e96').to_f if @bos_percent.include?("bb")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e99').to_f if @bos_percent.include?("bc")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e102').to_f if @bos_percent.include?("bd")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e105').to_f if @bos_percent.include?("be")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e108').to_f if @bos_percent.include?("bf")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e111').to_f if @bos_percent.include?("bg")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e114').to_f if @bos_percent.include?("bh")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e117').to_f if @bos_percent.include?("bi")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e120').to_f if @bos_percent.include?("bj")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e123').to_f if @bos_percent.include?("bk")
    return @bos_percent = (@bos_percent.slice(/\d+/)+'e126').to_f if @bos_percent.include?("bl")
  end 
  
  def henkanK(s)
    return (s.to_f)*1e3
  end
  
  def henkanM(s)
    return (s.to_f)*1e6
  end
  
  def henkanB(s)
    return (s.to_f)*1e9
  end
  
  def henkanT(s)
    return (s.to_f)*1e12
  end
  
  def search(s)
    return henkanK(s) if s.include?('K')
    return henkanM(s) if s.include?('M')
    return henkanB(s) if s.include?('B')
    return henkanT(s) if s.include?('T')
    return s.to_f
  end
  
  def search2(s) # eで判断　(s to s) e => KMBT 
    return e_round(s.to_f) if s.to_f > 1e17
    return s.slice(0,3)+'K' if s.include?("e3")
    return s.slice(0,3).delete('.')+'K' if s.include?("e4")
    return s.slice(0,4).delete('.')+'K' if s.include?("e5")
    return s.slice(0,3)+'M' if s.include?("e6")
    return s.slice(0,3).delete('.')+'M' if s.include?("e7")
    return s.slice(0,4).delete('.')+'M' if s.include?("e8")
    return s.slice(0,3)+'B' if s.include?("e9")
    return s.slice(0,3).delete('.')+'B' if s.include?("e10")
    return s.slice(0,4).delete('.')+'B' if s.include?("e11")
    return s.slice(0,3)+'T' if s.include?("e12")
    return s.slice(0,3).delete('.')+'T' if s.include?("e13")
    return s.slice(0,4).delete('.')+'T' if s.include?("e14")
    
    return s 
  end
  
  def search3(s) # 数値で判断 (i to s) int => KMBT
    return e_round(s) if s >= 1e15
    x = s
    s = s.to_i.to_s.delete(".")
    
    return s if x < 1000
    return s.slice(0,1)+ "." + s.slice(1,2) +'K' if x < 10000
    return s.slice(0,2)+ "." + s.slice(2,2) +'K' if x < 100000
    return s.slice(0,3)+ "." + s.slice(3,2) +'K' if x < 1000000
    return s.slice(0,1)+ "." + s.slice(1,2) +'M' if x < 10000000
    return s.slice(0,2)+ "." + s.slice(2,2) +'M' if x < 100000000
    return s.slice(0,3)+ "." + s.slice(3,2) +'M' if x < 1000000000
    return s.slice(0,1)+ "." + s.slice(1,2) +'B' if x < 10000000000
    return s.slice(0,2)+ "." + s.slice(2,2) +'B' if x < 100000000000
    return s.slice(0,3)+ "." + s.slice(3,2) +'B' if x < 1000000000000
    return s.slice(0,1)+ "." + s.slice(1,2) +'T' if x < 10000000000000
    return s.slice(0,2)+ "." + s.slice(2,2) +'T' if x < 100000000000000
    return s.slice(0,3)+ "." + s.slice(3,2) +'T' if x < 1000000000000000
    
    return s 
  end
  
  def henhenkan(s) # e -> letter
    
    if s.include?("e")
        sisuu = (s.slice(/\d*$/)).to_i
        if sisuu > 14
            cof = s.slice(0,3) if sisuu % 3 == 0
            cof = s.delete(".").slice(0,2) if sisuu % 3 == 1
            cof = s.delete(".").slice(0,3) if sisuu % 3 == 2
            s = cof + @letter_data[sisuu]
        end
    end
    return s
  end
  
  def henhenkan2(s) #letter -> e
    (0..@letter_data_uni.size()-1).each do |i|
        return hozyo(s,i) if s.include?(@letter_data_uni[i])
    end
    s
  end
  
  def hozyo(s,x)
      kari = s.to_f.to_s
      kari + "e#{15 + 3*x}"
  end
  
  def keisan2
    #import
    data
    reduction
    
    n = @aflvl.size()
    
    # letter => e (s => i)
    if @letter == "1"
        (0..n-1).each do |i|
            @aflvl[i] = aflvl_le_to_e(@aflvl[i])
        end
    end
    
    # KMBT, normal => num (s => i)
    
        (0..n-1).each do |i|
            @aflvl[i] = search(@aflvl[i]) if @aflvl[i].class == String
        end
    
    nowafc = 0
    @zero_or_one = []
    (0..n-1).each do |i|
        if @aflvl[i] == 0
            @zero_or_one[i] = 0
            @aflvl[i] = 0.01
        elsif
            @zero_or_one[i] = 1.0
            nowafc += 1
        end
    end
    
    @nowrelic = aflvl_le_to_e(@nowrelic)
    @nowrelic = search(@nowrelic) if @nowrelic.class == String
    
    nowafrelic = @af_cost[@afcost.to_i]
    
    
    # 処理
    
    if @perc == "25"
        $result = Array.new(5) { Array.new(3,0) } # id, relic, aflvl
        (0..4).each do |i|
            proc2
            $result[i][0] = @ans
            tmp_now = @nowrelic * 0.25
            $result[i][1] = @aflvl[@ans]
            @nowrelic -= @nowrelic * 0.25
            tmp_relic = @tcoef[@ans] * ((@aflvl[@ans]) ** @texpo[@ans]) 
            
            tmp_relic = tmp_relic + tmp_now
            
            @aflvl[@ans] = (tmp_relic.to_f / @tcoef[@ans]) ** (1.0 / @texpo[@ans])
            $result[i][2] = @aflvl[@ans]
        end
        @nowbos = @boscost / (@nowallcost + nowafrelic)
    elsif @perc == "5"
        $result = Array.new(10) { Array.new(3,0) } # id, relic, aflvl
        (0..9).each do |i|
            proc2
            $result[i][0] = @ans
            tmp_now = @nowrelic * 0.05
            $result[i][1] = @aflvl[@ans]
            @nowrelic -= @nowrelic * 0.05
            tmp_relic = @tcoef[@ans] * ((@aflvl[@ans]) ** @texpo[@ans]) 
            
            tmp_relic = tmp_relic + tmp_now
            
            @aflvl[@ans] = (tmp_relic.to_f / @tcoef[@ans]) ** (1.0 / @texpo[@ans])
            $result[i][2] = @aflvl[@ans]
        end
        @nowbos = @boscost / (@nowallcost + nowafrelic)
    elsif @perc == "1"
        $result = Array.new(20) { Array.new(3,0) } # id, relic, aflvl
        (0..19).each do |i|
            proc2
            $result[i][0] = @ans
            tmp_now = @nowrelic * 0.01
            $result[i][1] = @aflvl[@ans]
            @nowrelic -= @nowrelic * 0.01
            tmp_relic = @tcoef[@ans] * ((@aflvl[@ans]) ** @texpo[@ans]) 
            
            tmp_relic = tmp_relic + tmp_now
            
            @aflvl[@ans] = (tmp_relic.to_f / @tcoef[@ans]) ** (1.0 / @texpo[@ans])
            $result[i][2] = @aflvl[@ans]
        end
        @nowbos = @boscost / (@nowallcost + nowafrelic)
    end
    
  end
  
  def proc2
    n = @aflvl.size()
    @eff = []
    @eff[0] = 1 + @parrot_coef[0] * (@aflvl[0].to_f ** @growthExpo[0].to_f)
    (1..n-1).each do |i|
        @eff[i] = 10 * (1 + @parrot_coef[i] * (@aflvl[i].to_f ** @growthExpo[i].to_f))
    end
    cumcost = []
    @nowallcost = 0
    (0..n-1).each do |i|
        cumcost[i] = (@cost_coef[i].to_f / (1 + @cost_expo[i].to_f)) * (@aflvl[i].to_f ** (1 + @cost_expo[i].to_f))
    @nowallcost += cumcost[i]
    end
    
    @boscost = cumcost[0] 
    
    sum_ad = 0
    (0..n-1).each do |i|
        sum_ad += (@aflvl[i].to_f * @damage_bonus[i].to_f)
    end
    
    ad = []
    (0..n-1).each do |i|
        ad[i] = (sum_ad + @aflvl[i].to_f * @eff[14] * @damage_bonus[i].to_f) / sum_ad
    end
    
    af_name_eff = {}
    last_eff = []
    (0..n-1).each do |i|
        last_eff[i] = @zero_or_one[i] * (Math::log(ad[i] * (@eff[i] ** @r[i]))) / cumcost[i]
        af_name_eff["#{i}"] = last_eff[i]
    end
    
    #ans = af_name_eff.sort_by(&:last)
    ans = af_name_eff.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
    @ans = (ans[0][0]).to_i
    
    
  end
  
  def aflvl_le_to_e(s) # return i
    (0..@letter_data_uni.size()-1).each do |i|
      return (s.slice(/\d+/)+"e#{15 + 3*i}").to_f if s.include?(@letter_data_uni[i])
    end
    return s
  end
  
  def output_proc2(s) # i to s 
    
    # round_lvl の e => KMBT変換
    s = search3(s) if @letter != "1" # 1 to s
    return s if @letter != "1"

    if @letter == "1"
        
        s = s.to_s
        
        # e -> letter
        
        if s.include?("e")
          sisuu = s.slice(/\d*$/).to_i
          if sisuu > 14
            if sisuu % 3 == 0
              if s.delete(".").slice(/\d*/).size() == 2
                cof = s.slice(0,3)
              else
                cof = s.slice(0,4)
              end
            elsif sisuu % 3 == 1
                if s.delete(".").slice(/\d*/).size() == 2
                    cof = s.delete(".").slice(0,2) + "." + "00"
                elsif s.delete(".").slice(/\d*/).size() == 3
                    cof = s.delete(".").slice(0,2) + "." + s.slice(3,1) + "0"
                else
                    cof = s.delete(".").slice(0,2) + "." + s.slice(3,2)
                end
            else
                if s.delete(".").slice(/\d*/).size() == 2
                    cof = s.delete(".").slice(0,2) + "0." + "00"
                elsif s.delete(".").slice(/\d*/).size() == 3
                    cof = s.delete(".").slice(0,3) + "." + "00"
                elsif s.delete(".").slice(/\d*/).size() == 4
                    cof = s.delete(".").slice(0,3) + "." + s.to_s.slice(4,1) + "0"
                else
                    cof = s.delete(".").slice(0,3) + "." + s.to_s.slice(4,2)
                end
            end
            return s = cof + @letter_data[sisuu]
          end
        end
        s = search3(s.to_f)
    end
  end
  
  
  
  
end
