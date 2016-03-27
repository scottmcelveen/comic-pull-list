require 'Volumes'

class VolumesController < ApplicationController
  
  handles_sortable_columns do | conf |
    conf[:default_sort_value] = :name
    conf[:indicator_text] = { :asc => "&nbsp;&uarr;&nbsp;", :desc => "&nbsp;&darr;&nbsp;" }
  end
  
  def index
    if session["volumes"]
      @volumes = session["volumes"]
    else
      @volumes = Volumes.get params[:id]
      session["volumes"] = @volumes.sort_by! { |v| v["name"] }
    end
    if (params[:sort] && params[:sort].starts_with?("-")) then @volumes.reverse! end
  end
end
