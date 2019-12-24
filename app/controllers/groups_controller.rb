
class GroupsController < ApplicationController
    
    def index
        @prompt = TTY::Prompt.new

        @groups = Group.all - User.find(cookies[:user_id]).groups
    end
    def create
        group = Group.create(name:params[:group][:name],description:params[:group][:description])
        redirect_to groups_path
    end
    def connection
        group = Group.find(params[:id])
        user = User.find(cookies[:user_id])
        connection = Connection.create(user: user,group:group)
        redirect_to user_path(user)
    end
    def new
        @group = Group.new
    end
    
end