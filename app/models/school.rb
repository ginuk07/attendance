class School < ActiveRecord::Base
  has_many :clients
  validates_presence_of :name
  validates_uniqueness_of :name,
                          :message => "has already been used",
                          :case_sensitive => false
end
