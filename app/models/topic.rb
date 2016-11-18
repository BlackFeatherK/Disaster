class Topic < ApplicationRecord
	validates_presence_of :t_title , :t_content , :user_id

	belongs_to :user
	belongs_to :category
	has_many :comments , :dependent => :destroy
	
end
