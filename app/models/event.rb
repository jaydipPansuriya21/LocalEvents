class Event < ApplicationRecord 
    has_one :event_vote, dependent: :destroy, autosave: true
    has_many :vote_infos
    
    # it will go for picture_id & picture_type in images table     
    has_many :images, as: :picture, dependent: :destroy 
    delegate *EventVote::METHODS, to: :event_vote
    delegate 'images', to: :image
    STATUS_OPTIONS = %w(Pending Rejected Approved)
    validates :status, inclusion:  { in: STATUS_OPTIONS }  
    validates :title, presence: :true

    scope :latest_event, -> (status_type)  { where(status: status_type).order(created_at: :desc) }
    scope :oldest_event, -> (status_type)  { where(status: status_type).order(created_at: :asc) }
    scope :location_wise -> (status_type, location) { where(status: status_type, location: location).order(created_at: :desc) }
    scope :
    # Ex:- scope :active, -> {where(:active => true)}
   
    after_initialize do 
        self.build_event_vote if event_vote.nil?
    end

    def self.create_event(attributes)
        event = Event.new(attributes)
        event.status = "Pending"
        event
    end

    def get_event_by_filter_type(params)
        filter_hash = {}
        filter_hash[:location] = params[:location] if params[:location]
        filter_hash[:status] = params[:status] if params[:status]
        
    end

    def get_event_analytics
        self.event_vote
    end

    def increment_view
        self.viewcount += 1 
    end

    def modify_vote(data)
        vote_info = get_vote_info(data)
        if data[:type] == 'up'            
            vote_info.vote_type = true    
        elsif data[:type] == 'down'
            vote_info.vote_type = false
        end
        vote_info.save
        self.upvote = VoteInfo.where(user_id: data[:user_id].to_i, event_id: data[:event_id].to_i, vote_type: true).count
        self.downvote = VoteInfo.where(user_id: data[:user_id].to_i, event_id: data[:event_id].to_i, vote_type: false).count 
    end

    def get_vote_info(data) 
        VoteInfo.find_or_initialize_by(user_id: data[:user_id].to_i, event_id: data[:event_id].to_i)    
    end
end

