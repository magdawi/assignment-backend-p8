class User < ActiveRecord::Base

	def add_star!
		no_stars + 1
	end
end
