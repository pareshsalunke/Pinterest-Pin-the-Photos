class AddPicToReportPicture < ActiveRecord::Migration
  def change
    add_column :report_pictures, :pic, :integer
  end
end
