class Projectpost < ActiveRecord::Base
	attr_accessible :belief, :link, :name
	
	belongs_to :user

	validates :belief, presence: true, length: { maximum: 1000 }
	validates :user_id, presence: true
	validates :name, presence: true

	default_scope order: 'projectposts.created_at DESC'
end
