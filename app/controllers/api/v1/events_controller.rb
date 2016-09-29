module Api::V1
  class EventsController < ApplicationController
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
  end
end
