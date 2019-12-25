class PostsController < ApplicationController
    def new
        @user = User.find(cookies[:user_id])
        @groups = @user.groups
        @post = Post.new
    end
    def create
        @user = User.find(cookies[:user_id])
        Post.create(user:@user,group:Group.find(params[:group][:group_id]),content:params[:post][:content])
        redirect_to user_path(@user)
    end
    def destroy
        @user = User.find(cookies[:user_id])
        @post = Post.find_by(id:params[:id])
        @post.destroy
        redirect_to user_path(@user)
    end
end