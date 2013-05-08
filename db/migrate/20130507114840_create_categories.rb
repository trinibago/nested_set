class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_id
      t.integer :left
      t.integer :right

      t.timestamps
    end
  end
end
