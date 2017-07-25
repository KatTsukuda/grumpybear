class User < ApplicationRecord
  has_many :campaigns
  has_many :action_takers
end
