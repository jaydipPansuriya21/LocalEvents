class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :city
      t.text :description
      t.string :status 
      
      t.timestamps
    end
  end
end
