class TopicCommentsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_topic , :find_user

	def new 
		@comment = @topic.comments.build
	end

	def create
		@comment = @topic.comments.build(write_comment)
		if @comment.save
			flash[:notice] = "回覆成功"
			redirect_to topic_path(@topic)
		else
			render "new"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:alert] = "刪除成功"
		redirect_to topic_path(@topic)
	end

	private

	def write_comment
		params.require(:comment).permit(:c_content , :user_id)
	end

	def find_topic
		@topic = Topic.find(params[:topic_id])
	end

	def find_user
		@user = current_user
	end
end
