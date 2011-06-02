class AttendanceValue < ActiveRecord::Base
  belongs_to :client
  belongs_to :attendance_sheet
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :attendance_sheet
end
