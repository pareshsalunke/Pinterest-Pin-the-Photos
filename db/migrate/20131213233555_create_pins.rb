class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.integer :pic
      t.integer :user
      t.integer :board
      t.timestamp :pin_time

      t.timestamps
    end
  end
end
