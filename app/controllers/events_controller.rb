class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def event_analytics
    begin
      @event= Event.find(params[:id])
      @event_vote = @event.event_vote
    rescue
      raise "Some exception occure"
    end
  end
end
