class Campaign < ApplicationRecord
  belongs_to :user
  has_many :action_takers

  # friendly id!
  extend FriendlyId
  friendly_id :campaign_title

end
