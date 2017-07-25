class CreateActionTakers < ActiveRecord::Migration[5.1]
  def change
    create_table :action_takers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
