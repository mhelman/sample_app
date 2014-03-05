class AddClicksToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :clicks, :fixnum
  end
end
