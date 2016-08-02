class CreateMissionDoerLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :mission_doer_links do |t|
      t.integer :doer_id
      t.integer :mission_id

      t.timestamps
    end
  end
end
