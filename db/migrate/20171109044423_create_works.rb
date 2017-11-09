class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :image, null:false
      
      t.timestamps
    end
  end
end
