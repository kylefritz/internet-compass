# web.rb

require 'net/dns'
require 'json'
require 'sinatra'

get '/' do
  url = params[:url]
  if url
    ip = Resolver(url).answer[0].address.to_s
  else
    ip = nil
  end
  content_type :json
  {
    url: url,
    ip: ip
  }.to_json
end