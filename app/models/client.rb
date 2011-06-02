class Client < ActiveRecord::Base
  has_many :attendance_values
  has_many :attendance_sheets, :through => :attendance_values
  accepts_nested_attributes_for :attendance_values
  accepts_nested_attributes_for :attendance_sheets
end
