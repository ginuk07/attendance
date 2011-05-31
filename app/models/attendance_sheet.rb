class AttendanceSheet < ActiveRecord::Base
  has_many :clients, :through => :attendance_values
  has_many :attendance_values
  accepts_nested_attributes_for :clients, :attendance_values
end
