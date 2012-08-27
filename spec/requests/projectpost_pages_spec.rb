require 'spec_helper'

describe "Projectpost pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "projectpost creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create a projectpost" do
				expect { click_button "Post" }.should_not change(Projectpost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'projectpost_belief', with: "Lorem ipsum" }
			before { fill_in 'projectpost_name', with: "Lorem ipsum" }
			it "should create a projectpost" do
				expect { click_button "Post" }.should change(Projectpost, :count).by(1)
			end
		end
	end

	describe "projectpost destruction"  do
		before { FactoryGirl.create(:projectpost, user: user) }

		describe "as correct user" do
			before { visit root_path }

			it "should delete a projectpost" do
				expect { click_link "DELETE" }.should change(Projectpost, :count).by(-1)
			end
		end
	end
end

