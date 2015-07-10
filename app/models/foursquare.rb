class Foursquare < ActiveRecord::Base

  def CLIENT_ID
    ENV['foursquare_client_id']
  end

  def CLIENT_SECRET
    ENV['foursquare_client_secret']
  end

  def today
    today = Date.today.to_s
    today = today.gsub(/\W/, '')
  end

  end

  def get_pick
    response = HTTParty.get('https://api.foursquare.com/v2/venues/explore?near=austin&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=#{today}')
  end





  end
end
