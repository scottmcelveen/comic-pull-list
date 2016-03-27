require 'Issues'

class IssuesController < ApplicationController
  
  handles_sortable_columns do | conf |
    conf[:default_sort_value] = :name
    conf[:indicator_text] = { :asc => "&nbsp;&uarr;&nbsp;", :desc => "&nbsp;&darr;&nbsp;" }
  end
  
  def index
    @issues = Issues.get params[:sort], params[:page], params[:filter]
  end
end
