class AddTaskIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :task_id, :integer
    add_column :tasks, :doer_id, :integer, null: true
  end
end
