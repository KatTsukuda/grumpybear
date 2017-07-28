class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :org_name
      t.string :email
      t.string ::password_digest
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
