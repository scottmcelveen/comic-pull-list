require 'ComicVineBase'

class Issues < ComicVineBase
  def self.get sort, page, filter
    page ||= 1
    sort ||= "volume.name"
    limit = 10
    filter ||= 
    offset = (page.to_i - 1) * limit
    
    out = {:column => nil, :direction => nil}
    if sort.to_s.strip.match /\A((?:-|))([^-]+)\z/
      out[:direction] = $1.empty?? :asc : :desc
      out[:column] = $2.strip
    end
    
    sort = out[:column].to_s + ":" + out[:direction].to_s
    
    results = super("/issues", query: { :filter => "store_date:2016-01-27|2016-01-27", :field_list => "id,name,image,issue_number,volume", :sort => sort, :limit => limit, :offset => offset })
    @paginated_results = WillPaginate::Collection.create(page, limit, results.parsed_response["response"]["number_of_total_results"]) do |pager|
      pager.replace(results.parsed_response["response"]["results"]["issue"])
    end
  end
end