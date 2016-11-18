class DefaultPostulacionEstado < ActiveRecord::Migration
  def change
    change_column :postulacions, :estado, :string, default: 'En espera'
  end
end
