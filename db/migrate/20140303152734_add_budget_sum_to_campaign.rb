class AddBudgetSumToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :campaign_budget, :float
  end
end
