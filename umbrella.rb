p "Where are you located?"

user_location = gets.chomp

# user_location = "200 S Wacker"

# p user_location

require "open-uri"

gmaps_api_uri = "https://maps.googleapis.com/maps/api/geocode/json?address=" +  user_location + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"
# full_url = "https://maps.googleapis.com/maps/api/geocode/json?address=stalingrad&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

# subbed_string = full_url.gsub("stalingrad", user_location)
# p gmaps_api_uri

URI.open(gmaps_api_uri).read

raw_gmaps_data = URI.open(gmaps_api_uri).read

raw_gmaps_data.class

require "json"

parsed_gmaps_data = JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch('geometry')

loc = geo.fetch("location")

p latitude = loc.fetch("lat")

p longitude = loc.fetch("lng")

dark_sky_api = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/27.1751448,78.0421422"

URI.open(dark_sky_api).read

raw_dark_sky_api_data = URI.open(dark_sky_api).read

raw_dark_sky_api_data.class

parsed_dark_sky_data = JSON.parse(raw_dark_sky_api_data)

result_dark_sky_array = parsed_dark_sky_data.fetch("currently")

temp = result_dark_sky_array.fetch('temperature')

p temp

p "Your coordinates are " + latitude.to_s + ", " + longitude.to_s + "." 
p "It is currently " + temp.to_s + " degrees Farenheit"
