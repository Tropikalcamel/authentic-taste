class CreateNationalitiesLists < ActiveRecord::Migration[7.1]
  def change
    create_table :nationalities_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nationalities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
