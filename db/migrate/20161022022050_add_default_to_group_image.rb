class AddDefaultToGroupImage < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :image, :text, :default => 'http://res.cloudinary.com/ianlenehan/image/upload/v1477102417/Screen_Shot_2016-10-22_at_1.12.27_pm_ulvytz.png'
  end
end
