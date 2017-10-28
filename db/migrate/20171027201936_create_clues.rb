class CreateClues < ActiveRecord::Migration[5.1]
  def change
    create_table :clues do |t|
      t.integer :stop
      t.string :location
      t.text :clue
      t.string :activity
      t.string :answer
      t.string :picture

      t.timestamps
    end
  end
end
