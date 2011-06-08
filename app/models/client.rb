class Client < ActiveRecord::Base
  has_many :assignments
  belongs_to :school
  belongs_to :classification
  accepts_nested_attributes_for :assignments
  validates_presence_of :name
  validates_uniqueness_of :name,
                          :message => "has already been used",
                          :case_sensitive => false
end
