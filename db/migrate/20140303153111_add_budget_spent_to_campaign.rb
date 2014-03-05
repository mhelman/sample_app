class AddBudgetSpentToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :budgetSpent, :float
  end
end
