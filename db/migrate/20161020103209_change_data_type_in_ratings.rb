class ChangeDataTypeInRatings < ActiveRecord::Migration[5.0]
  def change
    change_column :ratings, :rating_score, 'integer USING CAST(rating_score AS integer)'
  end
end
