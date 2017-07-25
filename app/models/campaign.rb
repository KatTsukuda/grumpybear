class Campaign < ApplicationRecord
  belongs_to :user
  has_many :action_takers
end
