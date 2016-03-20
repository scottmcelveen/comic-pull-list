require 'ComicVineBase'

class Publishers < ComicVineBase
  def self.get sort, offset
    sort ||= "name:asc"
    offset ||= "0"
    super("/publishers", query: { :field_list => "id,name,image", :sort => sort, :limit => "20", :offset => offset })
  end
end