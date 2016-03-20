require 'Publishers'

class HomeController < ApplicationController
    def index
        @publishers = Publishers.get params["publisher_sort"], params["publisher_offset"]
    end
end
