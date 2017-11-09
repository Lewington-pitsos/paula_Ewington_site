class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :caption
      t.string :image

      t.timestamps
    end
  end
end
