class Product < ActiveRecord::Base
  validates_presence_of :code, :name
  validates_uniqueness_of :code
end
