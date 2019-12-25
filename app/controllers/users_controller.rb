class UsersController < ApplicationController
    def portal

    end

    def signup
        @user = User.new
    end
    def login
        @errors = flash[:error]
    end

    def loginverifier
        @user = User.find_by(name:params[:name],password:params[:password])
        if @user == nil
            flash[:error] = "Wrong Password"
            redirect_to login_path
        elsif @user.valid?
            redirect_to user_path(@user)
            
        end
    end
    def create
        @user = User.create(name: params[:user][:name],age:params[:user][:age],password: params[:user][:password])
        redirect_to user_path(@user)
    end
    def show
        
        @user = User.find(params[:id])
        @groups = @user.groups
        cookies[:user_id] = @user.id
        @posts = post_of_group
       
    end
    private
    def post_of_group
        @user = User.find(cookies[:user_id])
        @groups = @user.groups
        @posts = []
        @groups.each{|group| group.posts.each{|post| @posts << post} } 
        @posts
    end
   
end