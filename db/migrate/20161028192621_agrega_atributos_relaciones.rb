class AgregaAtributosRelaciones < ActiveRecord::Migration
  def change
  	  	add_column :gauchadas,:id_question, :integer
  	  	rename_column :gauchadas, :idPostulacion, :id_postulacion
  	  	add_column :questions,:id_gauchada, :integer
  	  	add_column :answers,:id_question, :integer
  end
end
