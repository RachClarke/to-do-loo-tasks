class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :deadline
      t.integer :priority, default: 2
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
