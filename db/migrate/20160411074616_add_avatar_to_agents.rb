class AddAvatarToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :avatar_file_name, :string
    add_column :agents, :avatar_file_size, :int
    add_column :agents, :avatar_content_type, :string
    add_column :agents, :avatar_updated_at, :datetime
  	
    add_column :agents, :first_name, :string
    add_column :agents, :last_name, :string
    add_column :agents, :state, :string
    add_column :agents, :status, :string
    add_column :agents, :country, :string
    add_column :agents, :description, :string
  end
end
