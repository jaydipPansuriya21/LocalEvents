class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

  def create 
    @event = Event.create_event(event_params)
    
    if @event.save
      render json: { notice: 'Event was successfully created' },  status: :ok
    else
      render json: {error: @event.errors }, status: :unprocessable_entity 
    end
  end

  def update 
    @event= Event.find(params[:id])
    @event.assign_attributes(event_params)
    if @event.save
      render json: { notice: 'Event was successfully updated' },  status: :ok
    else
      render json: {error: @event.errors }, status: :unprocessable_entity 
    end  
  end

  def event_analytics
    @event= Event.find(params[:id])
    @event_vote = @event.get_event_analytics
  end

  def add_view
    @event= Event.find(params[:event_id])
    @event.increment_view
    if @event.save
      render json: { notice: 'view was added successfully' },  status: :ok
    else
      render json: {error: @event.errors }, status: :unprocessable_entity 
    end     
  end

  def add_vote
    @event= Event.find(params[:event_id])
    @event.increment_votes(analytics_params)
    if @event.save
      render json: { notice: 'votes were added successfully' },  status: :ok
    else
      render json: {error: @event.errors }, status: :unprocessable_entity 
    end  
  end

  def remove_vote
    @event= Event.find(params[:event_id])
    @event.decrement_votes(analytics_params) 
    if @event.save
      render json: { notice: 'votes were removed successfully' },  status: :ok
    else
      render json: {error: @event.errors }, status: :unprocessable_entity 
    end  
  end

  private

  def event_params
    params.permit(:id, :title, :city, :description, :status)
  end

  def analytics_params
    params.permit(:event_id, :upvote, :downvote)
  end


end
