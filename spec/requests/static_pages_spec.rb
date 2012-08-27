require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }
		
		it { should have_selector('h1', text: 'Collaborist') }
		it { should have_selector('title', text: full_title('')) }
		it { should_not have_selector 'title', text: '| Home' }

		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:projectpost, user: user, belief: "Lorem ipsum", name: "Project 1")
				FactoryGirl.create(:projectpost, user: user, belief: "Dolor sit amet", name: "Project 2")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					page.should have_selector("li##{item.id}", text: item.belief)
				end
			end
		end
	end
	
	
	describe "Help page" do 
		before { visit help_path }
		
		it { should have_selector('h1', text: 'Any Questions')}
		it { should have_selector('title', text: full_title('Help')) }
	end
	
	
	describe "About Page" do 
		before { visit about_path }
		
		it { should have_selector('h1', text: 'About Collaborist')}
		it { should have_selector('title', text: full_title('About')) }
	end
	
	
	describe "Contact page" do 
		before { visit contact_path }
		
		it { should have_selector('h1',	text: 'Contact') }
		it { should have_selector('title',	text: full_title('Contact')) }
	end
end