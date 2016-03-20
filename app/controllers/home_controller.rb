require 'Publishers'

class HomeController < ApplicationController
  handles_sortable_columns
  def index
    @publishers = Publishers.get params["sort"], params["page"]
  end
end
