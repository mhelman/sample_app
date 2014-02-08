class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :targeting_string
      t.integer :user_id

      t.timestamps
    end
    add_index :campaigns, [:user_id, :created_at]
  end
end
