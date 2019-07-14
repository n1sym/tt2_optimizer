class ApplicationController < ActionController::Base
  include StaticPagesHelper
  
  protect_from_forgery with: :exception
  def hello
    render html: "やぁ^^"
  end
end
