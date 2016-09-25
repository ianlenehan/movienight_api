module Api::V1
  class GroupsController < ApplicationController

    def index
      groups = Group.all
      render json: groups
    end

    def members
      group = Group.find(params[:id])
      members = group.users
      render json: members
    end

    def create
      group = Group.new
      user = User.find(params[:id])
      group.group_name = params[:name]
      group.group_admin = params[:id]
      if group.save
        group.users << user
        render json: group
      else
        render json: { errors: group.errors }
      end
    end

    def add_user
      group = Group.find(params[:group_id])
      user = User.find(params[:id])
      group.users >> user

      render plain: "#{user.first_name} has been successfully added to the #{group.group_name} group."
    end

  end
end
