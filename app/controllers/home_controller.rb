require 'Publishers'

class HomeController < ApplicationController
  
  handles_sortable_columns do | conf |
    conf[:default_sort_value] = :name
    conf[:indicator_text] = { :asc => "&nbsp;&uarr;&nbsp;", :desc => "&nbsp;&darr;&nbsp;" }
  end
  
  def index
    @publishers = Publishers.get params[:sort], params[:page]
  end
end
