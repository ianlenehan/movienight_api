class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.text :rating_score
      t.timestamps null: false
    end
  end
end
