class CreateFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :taster_id, null: false

      t.timestamps
    end
  end
end
