class AddAdviseToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :advise, :text
  end
end
