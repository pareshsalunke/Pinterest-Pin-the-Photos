class AddCoulmnsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :web_url, :string
    add_column :pictures, :description, :string
  end
end
