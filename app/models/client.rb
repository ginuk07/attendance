class Client < ActiveRecord::Base
  has_many :assignments
  has_many :sheets, :through => :assignments
  belongs_to :classification
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :sheets
  validates_presence_of :name
  validates_uniqueness_of :name,
                          :message => "has already been used",
                          :case_sensitive => false
end
