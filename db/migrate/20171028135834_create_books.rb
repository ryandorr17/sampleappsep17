class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :keyword
      t.string :picture

      t.timestamps
    end
  end
end
