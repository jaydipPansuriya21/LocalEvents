require_relative '../services/amazon_service/file_upload.rb'
class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.get_event_by_filter_type(params)
  end

  def show 
    @event = Event.find_by(id: params[:id])
  end

  def create 
    @event = Event.create_event(event_params)
    @action_type = "created"
    @saved = @event.save
    if @saved 
      status_code = :ok 
    else
      status_code = :unprocessable_entity
    end
    render :messages, status: status_code
    # if @event.save
    #   render json: { notice: 'Event was successfully created' },  status: :ok
    # else
    #   render json: {error: @event.errors }, status: :unprocessable_entity 
    # end
  end

  def update 
    @event= Event.find_by(id: params[:id])
    @action_type = "updated"
    @event.assign_attributes(event_params)
    @saved = @event.save
    if @saved 
      status_code = :ok 
    else
      status_code = :unprocessable_entity
    end
    render :messages, status: status_code
    # if @event.save
    #   render json: { notice: 'Event was successfully updated' },  status: :ok
    # else
    #   render json: {error: @event.errors }, status: :unprocessable_entity 
    # end  
  end

  def event_analytics
    @event= Event.find_by(id: params[:id])
    @event_vote = @event.get_event_analytics
  end

  def add_view
    @event= Event.find_by(id: params[:event_id])
    action_type = "view added"
    @event.increment_view
    saved = @event.save
    if saved 
      status_code = :ok 
    else
      status_code = :unprocessable_entity
    end
    render :messages, status: status_code
    # if @event.save
    #   render json: { notice: 'view was added successfully' },  status: :ok
    # else
    #   render json: {error: @event.errors }, status: :unprocessable_entity 
    # end     
  end

  def update_vote
    @event= Event.find_by(id: params[:event_id])
    action_type = "vote added"
    @event.modify_vote(params)
    saved = @event.save
    if saved 
      status_code = :ok 
    else
      status_code = :unprocessable_entity
    end
    render :messages, status: status_code
    # if @event.save
    #   render json: { notice: 'votes were added successfully' },  status: :ok
    # else
    #   render json: {error: @event.errors }, status: :unprocessable_entity 
    # end  
  end


  private

  def event_params
    params.permit(:id, :title, :city, :description, :status)
  end

  def status_params
    params[:status_type] || Event::STATUS_OPTIONS
  end

end
