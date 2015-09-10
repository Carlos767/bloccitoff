class AddExpirationToTaskItems < ActiveRecord::Migration
  def change
    add_column :task_items, :expires_at, :datetime
  end
end
