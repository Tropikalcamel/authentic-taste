class CreateUserNationalities < ActiveRecord::Migration[7.1]
  def change
    create_table :user_nationalities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nationality, foreign_key: true

      t.timestamps
    end
  end
end
