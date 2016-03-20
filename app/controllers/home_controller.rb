require 'ComicVine'

class HomeController < ApplicationController
    def index
        @vine = ComicVine.new
        @publishers = @vine.publishers params["publisher_sort"], params["publisher_offset"]
    end
end
