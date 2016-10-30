class AgregoRolAUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :rol, :string, default:"UsReg"
  end
end
