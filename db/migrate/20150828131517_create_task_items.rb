class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|
      t.references :task, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
