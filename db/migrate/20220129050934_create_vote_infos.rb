class CreateVoteInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :vote_type

      t.timestamps
    end
  end
end
