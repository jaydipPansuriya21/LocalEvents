class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :images_path
      t.references :picture, polymorphic: true, null: false

      t.timestamps
    end
  end
end
