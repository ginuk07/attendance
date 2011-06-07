class Sheet < ActiveRecord::Base
  has_many :attendance_values, :dependent => :destroy
  has_many :clients, :through => :attendance_values, :order => :name
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :attendance_values, :allow_destroy => true
end
