class Foursquare < ActiveRecord::Base

# Foursquare API call URI format
# https://api.foursquare.com/v2/venues/explore?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD


  CLIENT_ID = ENV['foursquare_client_id']
  CLIENT_SECRET = ENV['foursquare_client_secret']

  def self.today
    today = Date.today.to_s.gsub(/\W/, '')
  end

  def self.get_pick(query)
    HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=austin&openNow=1&query=#{query}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=#{today}")
  end

  def self.pick_from_selection(selection)
    choices = selection.attributes.map do |attribute|
      attribute[0] if attribute[1] == true
    end

    # if selection.price
    #   choices += ["&price=#{selection.price}"]
    # end

    # if selection.distance
    #   choices += ["&radius=#{selection.distance.to_f/0.00062137}"]
    # end

    get_pick(choices.compact.join('+'))
  end

  def self.venue_info
    Foursquare.pick_from_selection(Selection.last)['response']['groups'].first['items']
  end

  def self.pick_name
    venue_info.map { |x| x['venue']['name'] }.uniq.first
  end

  def self.pick_address
    venue_info.map { |x| x['venue']['location']['formattedAddress']}.first[0]
  end

  def self.pick_city_and_zip
    venue_info.map { |x| x['venue']['location']['formattedAddress']}.first[1]
  end

  def self.pick_phone_number
    venue_info.map { |x| x['venue']['contact']['formattedPhone']}.first
  end

  def self.pick_website
    venue_info.map { |x| x['venue']['url']}.first
  end

  def self.pick_price
    venue_info.map { |x| x['venue']['price']}.first['tier']
  end

  def self.pick_rating
    venue_info.map { |x| x['venue']['rating']}.first
  end


end
