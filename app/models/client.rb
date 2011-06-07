class Client < ActiveRecord::Base
  has_many :attendance_values
  has_many :attendance_sheets, :through => :attendance_values
  belongs_to :classification
  accepts_nested_attributes_for :attendance_values
  accepts_nested_attributes_for :attendance_sheets
  validates_presence_of :name
  validates_uniqueness_of :name,
                          :message => "has already been used",
                          :case_sensitive => false
end
