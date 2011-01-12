class Product < ActiveRecord::Base
  has_many :features

  validates_presence_of :code, :name
  validates_uniqueness_of :code
end
