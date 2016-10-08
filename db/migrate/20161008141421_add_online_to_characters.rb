class AddOnlineToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :online, :boolean, default: true
  end
end
