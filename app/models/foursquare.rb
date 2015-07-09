class Foursquare < ActiveRecord::Base
  include HTTParty
  base_uri 'api.foursquare.com/v2/venues/explore'

  def client_id
    ENV['foursquare_client_id']
  end

  def client_secret
    ENV['foursquare_client_secret']
  end



  end
end
