class StaticPagesController < ApplicationController
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
    @input2 = @input.gsub(/,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,/, ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,").gsub(/\n/, ",")
    @input3 = @input2.split(",")
    @arr = Array.new(1000){ Array.new(30) }
    (0..999).each do |i|
      (0..29).each do |j|
        k = j + 30*i
        @arr[i][j] = @input3[k]
      end
    end  
    @count = 0

    (1..20).each do |i|
      if @arr[i][0] != @arr[1][0] then
        break
      end
      @count += 1
    end
    

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
