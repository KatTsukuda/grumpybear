class ActionTaker < ApplicationRecord
  belongs_to :user
  belongs_to :campaigns
end
