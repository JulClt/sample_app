FactoryGirl.define do
	factory :user do |user|
		user.nom                   "Julien"
		user.email                 "exemple@email.com"
		user.password 	           "motdepasse"
		user.password_confirmation "motdepasse"
	end
end