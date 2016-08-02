class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.integer :points
      t.datetime :due_date

      t.timestamps
    end
  end
end
