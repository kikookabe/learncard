class AddTotaltimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :Totaltime, :string
  end
end
