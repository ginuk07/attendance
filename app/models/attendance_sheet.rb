class AttendanceSheet < ActiveRecord::Base
  has_many :attendance_values
  has_many :clients, :through => :attendance_values
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :attendance_values, :allow_destroy => true
end
