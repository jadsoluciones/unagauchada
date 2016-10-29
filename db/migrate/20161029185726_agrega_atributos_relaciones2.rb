class AgregaAtributosRelaciones2 < ActiveRecord::Migration
  def change
  	  	add_column :usuarios,:id_gauchada, :integer
  	  	add_column :gauchadas,:id_usuario, :integer
  end
end
