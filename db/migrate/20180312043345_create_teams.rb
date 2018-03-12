class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :objective
      t.string :description
      t.integer :chat_id

      t.timestamps
    end
  end
end
