require 'spec_helper'

describe Projectpost do

	let(:user) { FactoryGirl.create(:user) }
	before { @projectpost = user.projectposts.build(belief: "Stats of the Union opens fact-checking up to everyone. In much the same way Wikipedia gave us a better encyclopedia Stats will give us a better fact-checking source. Opening the checking up to the public helps to solve the traditional problems of bias and scope that are inherent in current fact-checking sources. More than this we gain a new tool. By comprehensively tracking what is said we will create a check those in power.", name: "Stats Of the Union") }

	subject { @projectpost }

	it { should respond_to(:belief) }
 	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "accessibile attributes" do
		it "should not allow access to user_id" do
			expect do 
				Projectpost.new(user_id: user.id)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user_id is not present" do	
		before { @projectpost.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank belief entry" do
		before { @projectpost.belief = " " }
		it { should_not be_valid }
	end
	describe "with blank name entry" do
		before { @projectpost.name = " " }
		it { should_not be_valid }
	end

	describe "with belief that is too long" do
		before { @projectpost.belief = "a" * 1001 }
		it { should_not be_valid }
	end
end
