class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :category
      t.string :campaign_title
      t.string :description
      t.string :call_to_action
      t.string :target_email
      t.string :target_name
      t.integer :target_signers_goal

      t.timestamps
    end
  end
end
