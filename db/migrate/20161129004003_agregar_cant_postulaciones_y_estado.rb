class AgregarCantPostulacionesYEstado < ActiveRecord::Migration
  def change
    add_column :gauchadas, :estado, :string, default: 'En curso'
    add_column :gauchadas, :cant_postulantes, :integer, default: 0
  end
end
