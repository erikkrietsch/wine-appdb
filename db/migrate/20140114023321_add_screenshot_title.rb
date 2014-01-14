class AddScreenshotTitle < ActiveRecord::Migration
  def change
    change_table(:screenshots) do |t|
      t.string :title
    end
  end
end
