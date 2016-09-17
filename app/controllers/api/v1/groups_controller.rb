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
  end
end
