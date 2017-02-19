class Game < ActiveRecord::Base
	has_many :comments
	validates_presence_of :name
	validates_presence_of :from
	validates_presence_of :review
	validates_presence_of :image
end