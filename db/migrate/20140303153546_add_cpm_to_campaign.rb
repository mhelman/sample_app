class AddCpmToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :CPM, :float
  end
end
