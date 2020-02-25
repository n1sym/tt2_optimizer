class StaticPagesController < ApplicationController
  
require 'discordrb/webhooks'  
WEBHOOK_URL = 'https://discordapp.com/api/webhooks/681393841273831426/-ITUQFV-ZDEXR-RD4rpzG3IIgilFiJHjTF11MdMEdc56IHxe_ZfIy8Q0MZNZyMtHYB3V'.freeze

  def home
  end

  def cards
  end
  
  def raidrank
  end
  
  def contact
  end

  def link
  end
  
  def convert
  end
  
  def converter2
    cookies.permanent[:"buicheck"] = params[:data5][:"buicheck"]
    cookies.permanent[:"kagen"] = params[:data5][:"kagen"]
    (1..8).each do |i|
      cookies.permanent[:"tero#{i}"] = params[:data5][:"tero#{i}"]

    end
    (1..8).each do |i|
      cookies.permanent[:"sterl#{i}"] = params[:data5][:"sterl#{i}"]

    end
    (1..8).each do |i|
      cookies.permanent[:"mohaka#{i}"] = params[:data5][:"mohaka#{i}"]

    end
    (1..8).each do |i|
      cookies.permanent[:"lojak#{i}"] = params[:data5][:"lojak#{i}"]

    end
    (1..8).each do |i|
      cookies.permanent[:"take#{i}"] = params[:data5][:"take#{i}"]

    end
    (1..8).each do |i|
      cookies.permanent[:"jukk#{i}"] = params[:data5][:"jukk#{i}"]

    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def converter
    @buicheck = cookies[:"buicheck"]
    @kagen = cookies[:"kagen"]
    @tero =[]
    @sterl = []
    @mohaka = []
    @lojak = []
    @take = []
    @jukk = []
    (1..8).each do |i|
      @tero << cookies[:"tero#{i}"]
    end
    (1..8).each do |i|
      @sterl << cookies[:"sterl#{i}"]
    end
    (1..8).each do |i|
      @mohaka << cookies[:"mohaka#{i}"]
    end
    (1..8).each do |i|
      @lojak << cookies[:"lojak#{i}"]
    end
    (1..8).each do |i|
      @take << cookies[:"take#{i}"]
    end
    (1..8).each do |i|
      @jukk << cookies[:"jukk#{i}"]
    end
    
    @input = params[:data4][:log]
    @input2 = @input.gsub(/,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,/, ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,").gsub(/\n/, ",").gsub(/\n/, ",")
    @input3 = @input2.split(",")
    @arr = Array.new(1000){ Array.new(30) }
    (0..999).each do |i|
      (0..29).each do |j|
        k = j + 30*i
        @arr[i][j] = @input3[k]
      end
    end  
    @count = 0
    @titan = []

    (1..20).each do |i|
      if @arr[i][0] != @arr[1][0] then
        break
      end
      @count += 1
      @titan << @arr[i][4]
    end
    @titan.uniq!
    @percent = Array.new(1000,0){ Array.new(4,0) }
    @layer = Array.new(1000,0){ Array.new(2,0) }
    @name = Array.new(50){ Array.new(5) }
    (0..49).each do |i|
      total = 0
      k = @count*(i+1)
      @name[i][0] = i+1
      @name[i][1] = @arr[k][0]
      @name[i][2] = @arr[k][1]
      @name[i][3] = @arr[k][2]
      (@count*(i)+1..k).each do |j|
        total += (@arr[j][5]).to_i
      end  
      @name[i][4] = total
    end
    @tmp = @name
    (0..49).reverse_each do |i|
      @name.delete_at(i) if @tmp[i][1] == nil
    end  
    perce_check
    #layer_check
    kaiseki
    @checker = []
    if @buicheck == "1"
      buicheck
    end  
    @invalid = 0
    
    (0..((@checker.size()/4)-1)).each do |i|
      k=4*i+3
      dmg = 0
      dmg = (@checker[k]).to_f
      @invalid += dmg
      if dmg < (@kagen).to_f
        @checker[k] = "-"
        @checker[k-1] = "-"
        @checker[k-2] = "-"
        @checker[k-3] = "-"
      end  
    end  
    (0..(@checker.size()-1)).reverse_each do |i|
      @checker.delete_at(i) if @checker[i] == "-"
    end  
    
    @name_export = ""
    (0..(@name.size()-1)).each do |i|
      @name_export += @name[i][0].to_s
      @name_export += ","
      @name_export += @name[i][1].to_s
      @name_export += ","
      @name_export += @name[i][2].to_s
      @name_export += ","
      @name_export += @name[i][3].to_s
      @name_export += ","
      @name_export += @name[i][4].to_s
      @name_export += ","
      @name_export += ((@name[i][4]).to_i/(@name[i][3]).to_i).round(3).to_s
      @name_export += "\n"
    end
    
    stre = @name.join("\n") + ", avg:" + @avg2.to_s
    
    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = @name_export
      builder.add_embed do |embed|
        embed.title = 'Embed title'
        embed.description = 'Embed description'
        embed.timestamp = Time.now
      end
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def raidcalc
  end
  
  def raidcalcpost
    @calc_count = params[:carddata][:n]
    @card1 = cookies.permanent[:card1] = params[:carddata][:card1]
    @card2 = cookies.permanent[:card2] = params[:carddata][:card2]
    @card3 = cookies.permanent[:card3] = params[:carddata][:card3]
    @level1 = cookies.permanent[:level1] = params[:carddata][:level1]
    @level2 = cookies.permanent[:level2] = params[:carddata][:level2]
    @level3 = cookies.permanent[:level3] = params[:carddata][:level3]
    @buff = cookies.permanent[:buff] = params[:carddata][:buff]
    @debuff = cookies.permanent[:debuff] = params[:carddata][:debuff]
    @bone = cookies.permanent[:bone] = params[:carddata][:bone]
    
    @result = []
    cardinputproc
      (0..499).each do |i|
        raidcalc_core
        @result << @totaldamage
      end  
      @resultmax = @result.max
      @resultmin = @result.min
      @resultavg = @result.sum.fdiv(@result.length).floor
      @resultsort = @result.sort
      zyoui1 = (500*0.9).floor
      zyoui2 = (500*0.8).floor
      zyoui3 = (500*0.7).floor
      zyoui4 = (500*0.5).floor
      @result10p = @resultsort[zyoui1]
      @result20p = @resultsort[zyoui2]
      @result30p = @resultsort[zyoui3]
      @result50p = @resultsort[zyoui4]

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def optimiser
  end
  
  def optimiser2
  end
  
  def optimise4
    @letter = cookies[:letter]
    @perc = cookies[:perc]
    data
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    if @perc == "25"
      (0..4).each do |i|
        $aflvl[$result[i][0]] = $result[i][2]
        cookies.permanent[:"afnum#{$result[i][0]}"] = output_proc2($result[i][2])
      end
    elsif @perc == "5"
      (0..9).each do |i|
        $aflvl[$result[i][0]] = cookies.permanent[:"afnum#{$result[i][0]}"] = output_proc2($result[i][2])
      end
    else
      (0..19).each do |i|
        $aflvl[$result[i][0]] = cookies.permanent[:"afnum#{$result[i][0]}"] = output_proc2($result[i][2])
      end
    end
    
  end
  
  def henkan
  end
  
  def optimise3
    @build = cookies[:build]
    @gold = cookies[:gold]
    @hero1 = cookies[:hero1]
    @hero2 = cookies[:hero2]
    @perc = cookies.permanent[:perc] = params[:data3][:perc]
    @letter = cookies[:letter]
    @nowrelic = cookies.permanent[:nowrelic] = params[:data3][:nowrelic]
    @aflvl = []
    (0..57).each do |i|
      @aflvl[i] = cookies[:"afnum#{i}"]
    end
    
    keisan2
    $aflvl = @aflvl
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def optimise2
 
    @build = cookies.permanent[:build] = params[:data2][:build]
    @gold = cookies.permanent[:gold] = params[:data2][:gold]
    @hero1 = cookies.permanent[:hero1] = params[:data2][:hero1]
    @hero2 = cookies.permanent[:hero2] = params[:data2][:hero2]
    @letter = cookies.permanent[:letter] = params[:data2][:letter]
    @aflvl = []
    (0..57).each do |i|
      @aflvl[i] = cookies.permanent[:"afnum#{i}"] = params[:data2][:"afnum#{i}"]
    end
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
     
  end

  def export
    (0..57).each do |i|
      cookies.permanent[:"afnum#{i}"] = $round_lvl[i]
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def optimise
    @total_relic = cookies.permanent[:relic] = params[:data][:relic]
    @bos_percent = cookies.permanent[:bos] = params[:data][:bos]
    @afcost = cookies.permanent[:afc] = params[:data][:"afc"]
    @build = cookies.permanent[:build] = params[:data][:build]
    @gold = cookies.permanent[:gold] = params[:data][:gold]
    @hero1 = cookies.permanent[:hero1] = params[:data][:hero1]
    @hero2 = cookies.permanent[:hero2] = params[:data][:hero2]
    @letter = cookies.permanent[:letter] = params[:data][:letter]
    @ad = cookies.permanent[:AD] = params[:data][:AD]
    @effcheck = cookies.permanent[:effcheck] = params[:data][:effcheck]
    @af = []
    (0..57).each do |i|
      cookies.permanent[:"af#{i}"] = params[:data][:"af#{i}"]
      @af << params[:data][:"af#{i}"]
    end
   
    
    keisan
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
