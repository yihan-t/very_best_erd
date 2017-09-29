class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :venue,
             :foreign_key => "venues_id",
             :counter_cache => true

  belongs_to :dish,
             :foreign_key => "dishes_id",
             :counter_cache => true

  belongs_to :user,
             :foreign_key => "users_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
