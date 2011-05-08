class Post < ActiveRecord::Base
	def self.feed(last)
		self.where("created_at < ? ", last).order('created_at desc').limit(5)
	end
end