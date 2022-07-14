class AddCommentToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :comment, :text
  end
end
