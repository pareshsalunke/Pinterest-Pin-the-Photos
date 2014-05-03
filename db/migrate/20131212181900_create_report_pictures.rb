class CreateReportPictures < ActiveRecord::Migration
  def change
    create_table :report_pictures do |t|
      t.string :rep_description
      t.string :action_taken

      t.timestamps
    end
  end
end
