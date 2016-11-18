class CreatePostulacions < ActiveRecord::Migration
  def change
    create_table :postulacions do |t|
      t.text :descripcion
      t.datetime :fecha
      t.string :estado, default: 'En espera'

      t.timestamps null: false
    end
  end
end
