class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.string :contenido

      t.timestamps null: false
    end
  end
end
