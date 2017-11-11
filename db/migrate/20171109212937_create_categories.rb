class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
