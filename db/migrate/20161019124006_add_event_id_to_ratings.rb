class AddEventIdToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :event_id, :integer
  end
end
