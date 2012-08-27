class ProjectpostsController < ApplicationController
	before_filter :signed_in_user,	only: [:create, :destroy]
	before_filter :correct_user,	only: :destroy

	def index
	end

	def create
		@projectpost = current_user.projectposts.build(params[:projectpost])
		if @projectpost.save
			flash[:success] = "Project created, good luck."
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end
	
	def destroy
		@projectpost.destroy
		redirect_to root_url
	end

	private

		def correct_user
			@projectpost = current_user.projectposts.find_by_id(params[:id])
			redirect_to root_url if @projectpost.nil?
		end
end