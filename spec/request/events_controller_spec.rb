require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  context "GET methods" do

    it "Index method returns http success" do
      get :index, :format => :json
      expect(response).to have_http_status(:ok)
    end
    # it "Show method returns http success" do
    #   create(:event)
    #   get '/events/:id', { id: 1}
    #   expect(response).to have_http_status(:ok)
    # end
    # it "EventAnalytics method returns http success" do
    #   get 'events/event_analytics'
    #   expect(response).to have_http_status(:ok)
    # end
  end

  context "return proper a response" do
    # all get response
  end
  
  context "POST methods" do
    let!(:event) { create(:event) }
    let(:vote_params) do
      {
        event_id: event.id,
        upvote: 2,
        downvote: 1
      }
    end
    let(:view_params) do
      {
        event_id: event.id
      }   
    end

    # it 'increse viewcount' do
    #   expect{
    #     post :add_view, params: view_params
    #   }.to change { event.viewcount }.by(1)        
    # end

    # it 'increase votes' do
    #   expect{
    #     post :add_vote, params: vote_params
    #   }.to change { event.upvote }.by(2)
    #    .and change { event.downvote }.by(1)        
    # end

    # it 'decrease votes' do
    #   event.update(upvote: 10, downvote: 3, viewcount: 17)
    #   expect{
    #     post :remove_vote, params: vote_params
    #   }.to change { event.upvote }.by(2)
    #    .and change { event.downvote }.by(1)        
    # end

  end
  
end
