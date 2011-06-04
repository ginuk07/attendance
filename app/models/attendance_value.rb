class AttendanceValue < ActiveRecord::Base
  belongs_to :client
  belongs_to :attendance_sheet
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :attendance_sheet
  validates_presence_of :client
  validates_each :client, :on => :create do |model, attr, value|
    AttendanceValue.joins(:attendance_sheet, :client).where(:client_id => model.client.id).collect { |a| if a.attendance_sheet.date == model.attendance_sheet.date then model.errors.add(attr, 'already assigned to this attendance sheet') end }
  end
end
