class AddPlatformIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :platform_id, :integer
  end
end
