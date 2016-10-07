class AddStatsToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :offense, :integer, default: 100
    add_column :characters, :defense, :integer, default: 100
    add_column :characters, :stealth, :integer, default: 100
  end
end
