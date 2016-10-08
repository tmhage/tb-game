class RemoveOnlineFromCharacters < ActiveRecord::Migration[5.0]
  def change
    remove_column :characters, :online, :boolean
  end
end
