class ErrorsController < ApplicationController
  def error404
  #   render :file => "#{Rails.root}/public/404.html",  :status => 404
  render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end
