class AgregarColImagenGauchada < ActiveRecord::Migration
  def change
  	add_column :gauchadas,:cloudinary_id, :integer
  	rename_column :gauchadas, :imagen, :image_url
  end
end
