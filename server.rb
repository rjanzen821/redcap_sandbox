require "net/http"
require "uri"

url = 'https://redcap.vanderbilt.edu/api/'
token = '8F15CCA430FAEA2917BCABE663FF46BC' 
format = 'json'
content = 'record'

uri = URI.parse("https://redcap.nubic.northwestern.edu/redcap/api/")

# Shortcut
response = Net::HTTP.post_form(uri, {"token" => token, "format" => format, "content" => content,})
puts response
# Full control
#http = Net::HTTP.new(uri.host, uri.port)

#request = Net::HTTP::Post.new(uri.request_uri)
#request.set_form_data({"q" => "My query", "per_page" => "50"})

#response = http.request(request)