class Product < ActiveRecord::Base
  has_many :features
  has_many :sprints

  validates_presence_of :code, :name
  validates_uniqueness_of :code
end
