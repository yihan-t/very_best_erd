require 'open-uri'
class Venue < ApplicationRecord
  before_validation :geocode_venue_address

  def geocode_venue_address
    if self.venue_address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.venue_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.venue_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.venue_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.venue_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "venues_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
