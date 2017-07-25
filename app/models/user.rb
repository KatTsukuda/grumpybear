class User < ApplicationRecord
  has_many :campaigns
  has_many :action_takers

  # Friendly ID for users!
  extend FriendlyId
  friendly_id :org_name, use: :slugged
end
