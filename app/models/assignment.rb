class Assignment < ActiveRecord::Base
  include Comparable

  belongs_to :client
  belongs_to :sheet
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :sheet
  validates_presence_of :client
  validates_each :client, :on => :create do |model, attr, value|
    Assignment.joins(:sheet, :client).where(:client_id => model.client.id).collect { |a| if a.sheet.date == model.sheet.date then model.errors.add(attr, 'already assigned to this sheet') end }
  end

  def <=>(other)
    other.sheet.date <=> self.sheet.date
  end
end
