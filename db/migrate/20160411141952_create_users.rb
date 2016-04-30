class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :fb_id
      t.string :username
      t.string :email
      t.string :country
      t.string :status
      t.string :state

      t.timestamps null: false
    end
  end
end
