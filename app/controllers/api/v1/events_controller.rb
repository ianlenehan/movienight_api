module Api::V1
  class EventsController < ApplicationController
    def show
      event = Event.find(params[:event][:id])
      current_user = User.find_by(access_token: params[:user][:access_token])

      render json: {
        event: event,
        attendees: event.users,
        attending: is_user_attending?(current_user, event)
      }
    end

    def create
      event = Event.new
      event.location = params[:location]
      event.date = params[:date]
      event.group_id = params[:group_id]

      if event.save
        render json: event
      else
        render json: { errors: user.errors }
      end
    end

    def group_events
      events = Event.where(group_id: params[:group_id])
      render json: events
    end

    def add_movie
      event = Event.find(params[:event_id])
      if event.update(imdb_id: params[:movie])
        render json: event, status: 201
      else
        render json: { errors: event.errors }, status: 422
      end
    end

    def attending
      event = Event.find(params[:event][:id])
      current_user = User.find_by(access_token: params[:user][:access_token])
      event.users << current_user
      render json: event.users
    end

    def not_attending
      event = Event.find(params[:event][:id])
      current_user = User.find_by(access_token: params[:user][:access_token])
      event.users.delete(current_user)
      render json: event.users
    end

    private
    def is_user_attending?(user, event)
      event.users.include?(user)
    end
  end
end
