class Honeybee < ActiveRecord::Base
  attr_accessible :description, :location, :name
  validates :name, presence: true
  belongs_to :user
end
