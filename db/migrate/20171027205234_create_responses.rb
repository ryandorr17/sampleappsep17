class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :guess
      t.boolean :correct, default: false
      t.integer :round_number
      t.string :picture
      t.references :user, index: true

      t.timestamps
    end

    add_foreign_key :responses, :users
    add_index :responses, [:user_id, :created_at]

  end
end
