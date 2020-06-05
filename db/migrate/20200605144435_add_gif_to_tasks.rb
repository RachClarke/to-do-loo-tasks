class AddGifToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :gif_id, :string
  end
end
