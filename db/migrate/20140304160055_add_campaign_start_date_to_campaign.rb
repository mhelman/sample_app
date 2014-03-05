class AddCampaignStartDateToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :cstartdate, :date
  end
end
