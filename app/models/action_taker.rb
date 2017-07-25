class ActionTaker < ApplicationRecord
  belongs_to :user
  belongs_to :campaigns

  # friendly id!
  extend FriendlyId
  friendly_id :first_name
end
