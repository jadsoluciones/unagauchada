class AgregarUsuarioId < ActiveRecord::Migration
  def change
    add_column :postulacions, :usuario_id, :integer
  end
end
