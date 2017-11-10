class CreateAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.string :image
      t.string :statement
      t.string :bio

      t.timestamps
    end
  end
end
