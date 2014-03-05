class AddImpressionsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :impressions, :fixnum
  end
end
