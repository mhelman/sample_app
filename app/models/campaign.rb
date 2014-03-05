class Campaign < ActiveRecord::Base
  attr_accessible :name, :targeting_string, :campaign_budget, :CPM, :cstartdate, :cenddate
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates_numericality_of :campaign_budget, greater_than: 0
  default_scope -> { order('created_at DESC') }
end
