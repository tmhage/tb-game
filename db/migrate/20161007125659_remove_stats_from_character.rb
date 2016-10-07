class RemoveStatsFromCharacter < ActiveRecord::Migration[5.0]
  def change
    remove_column :characters, :offense, :integer
    remove_column :characters, :defense, :integer
    remove_column :characters, :stealth, :integer
  end
end
