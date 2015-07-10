class Foursquare < ActiveRecord::Base

  def client_id
    ENV['foursquare_client_id']
  end

  def client_secret
    ENV['foursquare_client_secret']
  end

  def get_pick
    response = HTTParty.get('https://api.foursquare.com/v2/venues/explore?near=austin')
  end





  end
end
