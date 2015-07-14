class Foursquare < ActiveRecord::Base

# Foursquare API call URI format
# https://api.foursquare.com/v2/venues/explore?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD


  CLIENT_ID = ENV['foursquare_client_id']
  CLIENT_SECRET = ENV['foursquare_client_secret']

  def today
    today = Date.today.to_s.gsub(/\W/, '')
  end

  def get_pick(query)
    HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=austin&query=#{query}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=#{today}")
  end

  def pick_from_selection(selection)
    choices = selection.attributes.map do |attribute|
      attribute[0] if attribute[1] == true
    end

    get_pick(choices.compact.join('+'))
  end

end
