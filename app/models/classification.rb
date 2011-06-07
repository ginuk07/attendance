class Classification < ActiveRecord::Base
  has_many :clients
  validates_presence_of :display_name, :name, :rate
  validates_numericality_of :rate, :greater_than => 0
end
