class Advkeywords < ActiveRecord::Base
  attr_accessible :keyword, :score
  validates :keyword,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :score,  presence: true
end
