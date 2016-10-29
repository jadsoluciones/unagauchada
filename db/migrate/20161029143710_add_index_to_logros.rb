class AddIndexToLogros < ActiveRecord::Migration
  def change
    add_index :logros, [:titulo,:puntaje], unique:true
  end
end
