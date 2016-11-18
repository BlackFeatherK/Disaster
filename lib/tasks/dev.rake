namespace :dev do 
	task :rebuild => ["db:reset" , :fake]
	task :fake do
		Category.create(:name => "快報資訊")
		Category.create(:name => "求物資")
		Category.create(:name => "求救")

		User.create( :email => "blacks@yahoo.com.tw" , :password => "123456" )
		10.times do
			User.first.topics.create(	:t_title => Faker::Lorem.word,
										:t_content => Faker::Lorem.sentence(100),
										:user_id =>	1,
										:category_id => 1)
		end

		10.times do
			e = User.create(:email => Faker::Internet.email , :password => "123456" )
			10.times do |i|
				e.topics.create(	:t_title => Faker::Lorem.word,
									:t_content => Faker::Lorem.sentence(100),
									:user_id =>	i,
									:category_id => 1)
			end
		end
	end
end