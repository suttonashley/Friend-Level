class DropMissionDoerLinks < ActiveRecord::Migration[5.0]
  def change
    drop_table :mission_doer_links
  end
end
