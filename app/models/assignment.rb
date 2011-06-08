class Assignment < ActiveRecord::Base
  include Comparable

  belongs_to :client
  accepts_nested_attributes_for :client
  validates_presence_of :client_id
  validates_each :client_id, :on => :create do |model, attr, value|
    a = Assignment.where(:client_id => model.client_id, :date => model.date)
    unless a.size == 0 then model.errors.add(attr, 'already assigned') end
  end

  def <=>(other)
    other.date <=> self.date
  end
end
