class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :size
      t.string :medium
      t.string :caption
      t.string :image
      t.integer :category_id
      t.integer :position
      t.integer :year

      t.timestamps
    end

    add_index :works, :category_id
    add_foreign_key :works, :categories
  end
end
