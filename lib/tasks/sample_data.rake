namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Example User",
		email: "example@randomSite.com",
		password: "foobar",
		password_confirmation: "foobar")

		admin.toggle!(:admin)
		
		99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@randomSite.com"
		password = "password"
		User.create!(name: name,
			email: email,
			password: password,
			password_confirmation: password)
		end

		users = User.all(limit: 30)
		7.times do	
			belief = Faker::Lorem.sentence(10)
			name = Faker::Lorem.sentence(1)
			users.each { |user| user.projectposts.create!(belief: belief, name: name) }
		end
	end
end	