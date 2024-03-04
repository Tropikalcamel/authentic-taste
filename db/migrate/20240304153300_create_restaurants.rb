class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.string :phone
      t.string :photo
      t.text :description
      t.boolean :take_away
      t.string :price_catagory
      t.boolean :authentic_badge
      t.string :opening_hours
      t.string :neighborhood
      t.string :dietary_requirements

      t.timestamps
    end
  end
end
