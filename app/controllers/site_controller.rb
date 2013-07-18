class SiteController < ApplicationController
  skip_before_filter :login_required


  def landing
  	render layout: false
  end
end
