class AddUserReferenceToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :user, foreign_key: true
  end
end
