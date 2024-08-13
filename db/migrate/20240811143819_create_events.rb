class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date
      t.string :category
      t.string :image
      t.integer :organizer_id

      t.timestamps
    end
  end
end
