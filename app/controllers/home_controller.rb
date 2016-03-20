require 'Publishers'

class HomeController < ApplicationController
  
  handles_sortable_columns do | conf |
    conf[:default_sort_value] = :name
  end
  
  def index
    @publishers = Publishers.get params[:sort], params[:page]
  end
end
