class Foursquare < ActiveRecord::Base

# Foursquare API call URI format
# https://api.foursquare.com/v2/venues/explore?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD

  CLIENT_ID = ENV['foursquare_client_id']
  CLIENT_SECRET = ENV['foursquare_client_secret']

  google_maps_api_key = ENV['google_maps_api_key']

  def initialize(data)
    @response = data
    puts data
  end

  def self.today
    today = Date.today.to_s.gsub(/\W/, '')
  end

  def self.get_pick(query)
    self.new(HTTParty.get("https://api.foursquare.com/v2/venues/explore?openNow=1&query=#{query}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=#{today}"))
  end

  def self.pick_from_selection(selection)
    choices = selection.attributes.map do |attribute|
      attribute[0] if attribute[1] == true
    end

    if selection.price
      choices += ["&price=#{selection.price}"]
    end

    if selection.distance
      choices += ["&radius=#{selection.distance.to_f/0.00062137}"]
    end

    if selection.lat
      choices += ["&ll=#{selection.lat},#{selection.long}"]
    else
      choices += ["&near=#{selection.zip_code}"]
    end

    get_pick(choices.compact.join("+").gsub(/serves_alcohol/,"drinks+beer").gsub(/outdoor_seating/,"outdoor+seating").gsub(/take_out/, "take+out"))
  end

  def response
    @response['response']
  end

  def pick_name
    venue_info.map { |x| x['venue']['name'] }.uniq.first
  end

  def pick_address
    address = venue_info.map { |x| x.fetch('venue').fetch('location').fetch('formattedAddress') }.first
    if address.nil?
      ''
    else
      address.first
    end
  end

  def pick_city_and_zip
    city_zip = venue_info.map { |x| x['venue']['location']['formattedAddress']}.first[1]
    if city_zip.nil?
      ''
    else
      city_zip
    end
  end

  def pick_phone_number
    venue_info.map { |x| x['venue']['contact']['formattedPhone']}.first
  end

  def pick_website
    venue_info.map { |x| x['venue']['url']}.first
  end

  def pick_price
    venue_info.map { |x| x['venue']['price']}.first['tier']
  end

  def pick_rating
    venue_info.map { |x| x['venue']['rating']}.first
  end

  def results_count
    @response['response']['totalResults']
  end

  def venue_info
    @response['response']['groups'].first['items']
  end

end
