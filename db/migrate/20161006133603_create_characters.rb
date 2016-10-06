class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :balance, default: 500
      t.boolean :alive, default: true
      t.string :gender
      t.integer :age, default: 16
      t.integer :offense
      t.integer :defense
      t.integer :stealth
      t.integer :rank, default: 1
      t.string :image

      t.timestamps
    end
  end
end
