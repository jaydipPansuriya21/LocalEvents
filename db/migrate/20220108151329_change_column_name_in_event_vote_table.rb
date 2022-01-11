class ChangeColumnNameInEventVoteTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_votes, :downvot, :downvote
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
