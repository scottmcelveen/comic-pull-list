require 'Volumes'

class VolumesController < ApplicationController
  
  handles_sortable_columns do | conf |
    conf[:default_sort_value] = :name
    conf[:indicator_text] = { :asc => "&nbsp;&uarr;&nbsp;", :desc => "&nbsp;&darr;&nbsp;" }
  end
  
  def index
    @volumes = Volumes.get params[:id]
  end
end
