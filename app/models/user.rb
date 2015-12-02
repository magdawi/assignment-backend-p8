class User < ActiveRecord::Base
	validates :middle_initial, length: {maximum: 1}

	def add_star!
		no_stars + 1
	end
end
