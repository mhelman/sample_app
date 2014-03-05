class AddCampaignEndDateToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :cenddate, :date
  end
end
