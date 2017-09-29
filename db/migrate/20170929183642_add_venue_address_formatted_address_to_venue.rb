class AddVenueAddressFormattedAddressToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :venue_address_formatted_address, :string
  end
end
