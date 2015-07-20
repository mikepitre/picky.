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

    if selection.price != ""
      choices += ["&price=#{selection.price}"]
    end

    if selection.distance != ""
      choices += ["&radius=#{selection.distance.to_f/0.00062137}"]
    end

    if selection.lat != ""
      choices += ["&ll=#{selection.lat},#{selection.long}"]
    else
      choices += ["&near=#{selection.zip_code}"]
    end

    get_pick(choices.compact.join("+").gsub(/serves_alcohol/,"beer").gsub(/outdoor_seating/,"outdoor+seating").gsub(/take_out/, "good+for+a+quick+meal"))
  end

  def response
    @response['response']
  end

  def pick_name(n = 0)
    venue_info.map { |x| x['venue']['name'] }.uniq[n]
  end

  def pick_address(n = 0)
    address = venue_info.map { |x| x.fetch('venue').fetch('location').fetch('formattedAddress') }[n]
    if address.nil?
      ''
    else
      address.first
    end
  end

  def pick_city_and_zip(n = 0)
    city_zip = venue_info.map { |x| x['venue']['location']['formattedAddress']}[n][1]
    if city_zip.nil?
      ''
    else
      city_zip
    end
  end

  def pick_phone_number(n = 0)
    venue_info.map { |x| x['venue']['contact']['formattedPhone']}[n]
  end

  def pick_website(n = 0)
    venue_info.map { |x| x['venue']['url']}.uniq[n]
  end

  def pick_price(n = 0)
    venue_info.map { |x| x['venue']['price']}[n]['tier']
  end

  def pick_rating(n = 0)
    venue_info.map { |x| x['venue']['rating']}[n]
  end

  def pick_hours(n = 0)
    if venue_info.map { |x| x['venue']['hours']}[n] == nil
      ''
    else
      venue_info.map { |x| x['venue']['hours']}[n]['status']
    end
  end

  def results_count
    @response['response']['totalResults']
  end

  def venue_info(n = 0)
    @response['response']['groups'][n]['items']
  end

end
