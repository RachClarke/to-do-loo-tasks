class ChangeDateToDatetimeInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :datetime
  end
end
