class AgregarColumnaGauchada < ActiveRecord::Migration
  def change
  	add_column :gauchadas,:idPostulacion, :integer
  	
  end
end
