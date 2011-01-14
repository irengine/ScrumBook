class Feature < ActiveRecord::Base
  belongs_to :product
  belongs_to :sprint

  validates_presence_of :subject
end
