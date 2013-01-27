class Admin::PagesController < ApplicationController
  layout "admin"
   before_filter :authenticate_admin! # Tell devise to use :admin map
  def home
  end
  def content
  end
end
