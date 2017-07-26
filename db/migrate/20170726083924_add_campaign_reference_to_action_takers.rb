class AddCampaignReferenceToActionTakers < ActiveRecord::Migration[5.1]
  def change
    add_reference :action_takers, :campaign, foreign_key: true
  end
end
