class Topic < ActiveRecord::Base
  has_many :comments
  validates :description, presence: true
  validates :title, presence: true
end