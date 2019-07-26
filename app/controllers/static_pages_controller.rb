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
