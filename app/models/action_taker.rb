class ActionTaker < ApplicationRecord
  belongs_to :user
  belongs_to :campaigns, :class_name => 'User', :foreign_key => 'user_id'
end
