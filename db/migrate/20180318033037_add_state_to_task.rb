class AddStateToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :state, :boolean
  end
end
