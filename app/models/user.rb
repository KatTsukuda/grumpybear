class User < ApplicationRecord
  # Friendly ID for users!
  extend FriendlyId
  friendly_id :org_name, use: [:slugged, :finders]
  
  has_many :campaigns
  has_many :action_takers



end
