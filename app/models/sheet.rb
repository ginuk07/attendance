class Sheet < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy
  has_many :clients, :through => :assignments, :order => :name
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :assignments, :allow_destroy => true
end
