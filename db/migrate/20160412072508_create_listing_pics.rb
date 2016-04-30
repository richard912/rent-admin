class CreateListingPics < ActiveRecord::Migration
  def change
    create_table :listing_pics do |t|
    	t.attachment :avatar
	    t.integer :listing_id

      t.timestamps null: false
    end    
    add_reference :listing_pics, :listings, index: true
    add_foreign_key :listing_pics, :listings
  end
end
