class PostsController < ApplicationController
    def new
        @user = User.find(cookies[:user_id])
        @groups = @user.groups
        @post = Post.new
        @errors = flash[:errors]
    end
    def create
        if params[:group]
            group = Group.find(params[:group][:group_id])
        end
        @user = User.find(cookies[:user_id])
        content = params[:post][:content]
        @post = Post.create(user:@user, group:group, content:content)
        if @post.valid?
            redirect_to user_path(@user)
        elsif @post.errors
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end
    def destroy
        @user = User.find(cookies[:user_id])
        @post = Post.find_by(id:params[:id])
        @post.destroy
        redirect_to user_path(@user)
    end
end