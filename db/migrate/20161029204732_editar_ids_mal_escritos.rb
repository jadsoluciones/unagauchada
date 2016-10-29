class EditarIdsMalEscritos < ActiveRecord::Migration
  def change
  	  rename_column :questions, :id_gauchada, :gauchada_id
  	  rename_column :answers, :id_question, :question_id

  	  remove_column :gauchadas, :id_postulacion
  	  remove_column :gauchadas, :id_question
  	  remove_column :usuarios, :id_gauchada
  	  
  	  add_column :questions, :usuario_id, :integer




  end
end
