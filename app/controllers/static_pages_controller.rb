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

  def optimise
    cookies.permanent[:relic] = params[:data][:relic]
    cookies.permanent[:bos] = params[:data][:bos]
    cookies.permanent[:afc] = params[:data][:"afc"]
    cookies.permanent[:build] = params[:data][:build]
    cookies.permanent[:gold] = params[:data][:gold]
    cookies.permanent[:hero1] = params[:data][:hero1]
    cookies.permanent[:hero2] = params[:data][:hero2]
    cookies.permanent[:letter] = params[:data][:letter]
    cookies.permanent[:AD] = params[:data][:AD]
    
    (0..57).each do |i|
    cookies.permanent[:"af#{i}"] = params[:data][:"af#{i}"]
    end
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
