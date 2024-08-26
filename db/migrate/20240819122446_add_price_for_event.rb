class AddPriceForEvent < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.decimal :price
    end
  end
end
