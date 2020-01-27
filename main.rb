require 'csv'
require 'net/http'
require 'json'
API_KEY = ""#Insert your API key here
table = CSV.parse(File.read('input.tsv'))
q=table[1][0]
txt = Net::HTTP.get(URI("https://graphhopper.com/api/1/geocode?q="+q+"&locale=en&debug=true&key="+API_KEY))
json = JSON.parse(txt)
from_lon = String json['hits'][0]["point"]["lng"]
from_lat = String json['hits'][0]["point"]["lat"]
puts(String(from_lon))
puts(String(from_lat))
routeUrl = "https://graphhopper.com/api/1/route?point="+from_lat+","+from_lon+"&point=51.5076,-0.1276&key="+API_KEY
txt = Net::HTTP.get(URI(routeUrl))
json = JSON.parse(txt)
puts "Distance is "+String(json["paths"][0]["distance"])+" m"
