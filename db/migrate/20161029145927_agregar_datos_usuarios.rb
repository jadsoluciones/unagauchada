class AgregarDatosUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido, :string
    add_column :usuarios, :domicilio, :string
    add_column :usuarios, :fecNac, :datetime
    add_column :usuarios, :DNI, :integer
    add_column :usuarios, :puntos, :integer, default: 1
  end
end
