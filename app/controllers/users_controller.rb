class UsersController < ApplicationController
    def portal
        
    end

    def signup
        @user = User.new
        @errors = flash[:error]
    end
    def login
        @errors = flash[:error]
    end

    def loginverifier
        @user = User.find_by(username:params[:username].downcase,password:params[:password])
        if @user == nil
            flash[:error] = "Wrong Password"
            redirect_to login_path
        elsif @user.valid?
            redirect_to user_path(@user)   
        end
    end
    def create
        @user = User.create(username:params[:user][:username],name: params[:user][:name].downcase,age:params[:user][:age],password: params[:user][:password],location:params[:user][:location])
        if @user.valid?
            redirect_to user_path(@user)
        elsif @user.errors
            flash[:error] = @user.errors.full_messages
            redirect_to signup_path
        end
    end
    def show
        
        @user = User.find(params[:id])
        @groups = @user.groups
        cookies[:user_id] = @user.id
        @posts = post_of_group
        @followers = @user.followers
        @followees = @user.followees
       
    end
    def profile
        @user = User.find(params[:id])
        @main_user = User.find(cookies[:user_id])
        @followees = @main_user.followees
    end
    def signout
        cookies[:user_id] = 0
        redirect_to portal_path
    end
    def index
        @user = User.find(cookies[:user_id])
        @all_users = []
        User.all.each{|user|@all_users << user}
        @all_users.delete(@user)
        @user.followees.each do|followee|
            if @all_users.include?(followee)
                @all_users.delete(followee)
            end
        end

    end
    def follower
        @following_user = User.find(params[:id])
        @main_user = User.find(cookies[:user_id])
        Follow.create(follower_id:@main_user.id,followee_id: @following_user.id)
        redirect_to user_path(@main_user.id)
    end
    def delete_follower
        @user = User.find(cookies[:user_id])
        @unfollowed_user = User.find(params[:id])
        @follow_instance = Follow.find_by(follower_id:@user,followee_id: @unfollowed_user.id)
        @follow_instance.delete
        redirect_to user_path(@user.id)

    end
    def edit
        @user = User.find(cookies[:user_id])
    end
    def update
        @user = User.find(cookies[:user_id])
        @user.update(username:params[:user][:username],name: params[:user][:name].downcase,age:params[:user][:age],password: params[:user][:password],location:params[:user][:location])
        redirect_to user_path(@user)
    end
    private
    def post_of_group
        @user = User.find(cookies[:user_id])
        @groups = @user.groups
        @posts_by_groups = []
        @groups.each{|group| group.posts.each{|post| @posts_by_groups << post} } 
        @posts_by_followees = []
        @user.followees.each{|followee|followee.posts.each{|post|@posts_by_followees << post}}
        @posts = @posts_by_groups + @posts_by_followees
        @posts
    end
   
end