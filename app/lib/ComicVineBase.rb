class ComicVineBase
  include HTTParty
  base_uri 'comicvine.gamespot.com/api/'
  headers 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/601.4.4 (KHTML, like Gecko) Version/9.0.3 Safari/601.4.4'
  default_params api_key: ENV["COMIC_VINE_API_KEY"]
end