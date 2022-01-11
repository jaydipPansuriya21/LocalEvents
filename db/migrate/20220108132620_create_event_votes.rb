class CreateEventVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :event_votes do |t|
      t.integer :upvote
      t.integer :downvot
      t.integer :viewcount
      t.belongs_to :event

      t.timestamps
    end
  end
end
