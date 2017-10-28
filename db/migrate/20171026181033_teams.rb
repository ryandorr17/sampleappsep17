class Teams < ActiveRecord::Migration[5.1]
  def change
  	create_table :teams do |t|
  		t.string	:team_name
  		t.string	:tagline
  		t.string	:picture
  		t.references	:user, foreign_key: true

  		t.timestamps
  	end

  	add_index :teams, [:user_id, :created_at]
	end

end
