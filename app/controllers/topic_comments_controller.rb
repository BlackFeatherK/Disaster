class TopicCommentsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_topic , :find_user

	def new 
		@comment = @topic.comments.build
	end

	def create
		@comment = @topic.comments.build(write_comment)
		@comment.user = current_user
		if @comment.save
			flash[:notice] = "回覆成功"
			redirect_to topic_path(@topic)
		else
			render "new"
		end
	end

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		flash[:alert] = "刪除成功"
		redirect_to topic_path(@topic)
	end

	private

	def write_comment
		# 不應該透過params傳遞user_id 不然有被篡改的可能
		params.require(:comment).permit(:c_content)
	end

	def find_topic
		@topic = Topic.find(params[:topic_id])
	end

	def find_user
		@user = current_user
	end
end
