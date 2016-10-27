class CreateGauchadas < ActiveRecord::Migration
  def change
    create_table :gauchadas do |t|
      t.string :titulo
      t.string :descripcion
      t.string :imagen
      t.string :ciudad

      t.timestamps null: false
    end
  end
end
