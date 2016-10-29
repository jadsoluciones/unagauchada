class EditarIdRelaciones < ActiveRecord::Migration
  def change
  	  rename_column :gauchadas, :id_usuario, :usuario_id
  end
end
