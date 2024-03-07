class AddWeightToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :weight, :integer, default:1
  end
end
