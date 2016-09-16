module Api::V1
  class GroupsController < ApplicationController

    def index
      groups = Group.all
      render json: groups
    end
  end
end
