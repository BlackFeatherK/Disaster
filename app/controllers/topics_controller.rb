class TopicsController < ApplicationController
	before_action :authenticate_user! , :except => :index
	before_action :find_user
	before_action :find_topic , :except => :show
	# 刪除修改缺乏後端驗證
	before_action :find_own_topic , :except => [:edit , :update , :destroy]

	def index
		@topics = Topic.page(params[:page]).per(15)
	end

	def show
		@comments = @topic.comments
		@category = @topic.category
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(write_topic)
		@topic.user = current_user
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
		params.require(:topic).permit(:t_title , :t_content , :category_id )
	end

	def find_topic
		@topic = Topic.find(params[:id])
	end

	def find_user
		@user = current_user
	end

	def find_own_topic
		@topic = current_user.topics.find(params[:id])
	end

end
