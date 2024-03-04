class CreateNationalities < ActiveRecord::Migration[7.1]
  def change
    create_table :nationalities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nationalities_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
