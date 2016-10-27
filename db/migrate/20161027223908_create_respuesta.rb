class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.string :contenido

      t.timestamps null: false
    end
  end
end
