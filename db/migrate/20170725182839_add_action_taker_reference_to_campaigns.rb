class AddActionTakerReferenceToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :action_taker, foreign_key: true
  end
end
