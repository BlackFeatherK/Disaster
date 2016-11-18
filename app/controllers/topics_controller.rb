class TopicsController < ApplicationController

	before_action :find_user
	before_action :find_topic , :except =>  [:index , :new , :create]

	def index
		@topics = Topic.all.page(params[:page]).per(15)
	end

	def show

	end

	def new 
		authenticate_user!
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(write_topic)
		if @topic.save
			flash[:notice] = "新增成功"
			redirect_to topics_path
		else
			render "new"
		end
	end

	def edit 

	end

	def update
		if @topic.update(write_topic)
			flash[:notice] = "更新成功"
			redirect_to topic_path(@topic)
		else
			render "edit"
		end
	end

	def destroy
		@topic.destroy
		flash[:alert] = "刪除成功"
		redirect_to topics_path
	end


	private

	def write_topic
		params.require(:topic).permit(:t_title , :t_content , :user_id)
	end

	def find_topic
		@topic = Topic.find(params[:id])
	end

	def find_user
		@user = current_user
	end


end
