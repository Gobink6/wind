class Windform < ApplicationRecord
	validates_uniqueness_of :user
end
