class AddDefaultValueRatings < ActiveRecord::Migration[5.0]
  def change
    change_column :ratings, :rating_score, :integer, :default => 0
  end
end
