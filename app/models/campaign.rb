class Campaign < ActiveRecord::Base
  attr_accessible :name, :targeting_string
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }
end
