class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_type
      t.string :state
      t.integer :year_built
      t.integer :lot_size
      t.float :price_per_sqft
      t.integer :beds
      t.integer :walk_score
      t.integer :mls_id
      t.string :description
      t.string :status
      t.integer :baths
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
