class Topic < ApplicationRecord
	# 欄位的設計其實不用是t_title之類的東西
	# 因為到最後程式碼會是 @topic.title 會比@topic.t_title來的好看些
	validates_presence_of :t_title , :t_content , :user_id

	belongs_to :user
	belongs_to :category
	has_many :comments , :dependent => :destroy
	
end
