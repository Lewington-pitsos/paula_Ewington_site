class AddAboutCover < ActiveRecord::Migration[5.1]
  def change
    add_column :abouts, :cover, :string
  end
end
