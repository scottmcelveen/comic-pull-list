require 'ComicVineBase'

class Volumes < ComicVineBase
  def self.get id
    results = super("/publisher/"+id, query: { :field_list => "id,name,image,volumes" })
    volumes = results.parsed_response["response"]["results"]["volumes"]["volume"]
    if volumes.is_a? Hash
    then volumes = [volumes]
    end
    volumes
  end
end