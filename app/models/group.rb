class Group < ApplicationRecord
  validates :group_name, :presence => true, :uniqueness => true
  has_and_belongs_to_many :users
  has_many :events, :through => :users
end
