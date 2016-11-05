class CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.string :titulo
      t.integer :min
      t.integer :max

      t.timestamps null: false
    end
  end
end
