class AddVenueAddressLongitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :venue_address_longitude, :float
  end
end
