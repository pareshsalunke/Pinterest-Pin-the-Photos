class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :web_url
      t.string :description
      t.integer :uid

      t.timestamps
    end
  end
end
