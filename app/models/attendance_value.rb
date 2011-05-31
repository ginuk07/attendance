class AttendanceValue < ActiveRecord::Base
  belongs_to :client
  belongs_to :attendance_sheet
end
