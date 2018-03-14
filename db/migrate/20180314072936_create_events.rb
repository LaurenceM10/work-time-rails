class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
