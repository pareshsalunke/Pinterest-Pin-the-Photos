class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :board_title
      t.integer :user
      t.integer :catergory

      t.timestamps
    end
  end
end
