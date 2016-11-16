class AgregarColImagenUsuario < ActiveRecord::Migration
  def change
  	  	add_column :usuarios,:cloudinary_id, :integer
  	  	add_column :usuarios,:image_url, :string

  end
end
