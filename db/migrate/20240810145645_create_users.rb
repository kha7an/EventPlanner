class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.integer :age
      t.string :gender
      t.string :phone

      t.timestamps
    end
  end
end
