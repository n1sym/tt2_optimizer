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
  
  def optimise2
    
    (0..57).each do |i|
      cookies.permanent[:"afnum#{i}"] = params[:data2][:"afnum#{i}"]
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
