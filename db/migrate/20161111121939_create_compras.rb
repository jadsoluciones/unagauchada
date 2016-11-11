class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :monto
      t.integer :puntos_comprados

      t.timestamps null: false
    end
  end
end
