class AddAgentIdToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :agent_id, :integer
  end
end
