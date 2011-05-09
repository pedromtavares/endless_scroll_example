class Post < ActiveRecord::Base
	validates_presence_of :body, :author
	def self.feed(last)
		self.where("created_at < ? ", last).order('created_at desc').limit(5)
	end
end