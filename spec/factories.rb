FactoryGirl.define do 
	factory :user do 
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end

	factory :projectpost do
		belief	"Lorem ipsum.paragraphs(3)"
		name 	"Lorem ipsum.sentence"
		link	"Lorem ipsum.com"
		user
	end
end