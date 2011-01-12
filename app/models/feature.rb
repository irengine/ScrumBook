class Feature < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :subject
end
