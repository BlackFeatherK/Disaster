namespace :dev do 
	task :rebuild => ["db:reset" , :fake]
	task :fake do
		User.create( :email => "blacks@yahoo.com.tw" , :password => "123456" )
		10.times do
			User.first.topics.create(	:t_title => Faker::Lorem.word,
										:t_content => Faker::Lorem.sentence(100),
										:user_id =>	1)
		end

		10.times do
			e = User.create(:email => Faker::Internet.email , :password => "123456" )
			10.times do |i|
				e.topics.create(	:t_title => Faker::Lorem.word,
									:t_content => Faker::Lorem.sentence(100),
									:user_id =>	i)
			end
		end
	end
end