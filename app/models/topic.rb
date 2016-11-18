class Topic < ApplicationRecord
	validates_presence_of :t_title , :t_content , :user_id

	belongs_to :user
	has_many :category_topicships , :dependent => :destroy
	has_many :categories , :through => :category_topicships , :dependent => :destroy
	has_many :comments , :dependent => :destroy
	
end
