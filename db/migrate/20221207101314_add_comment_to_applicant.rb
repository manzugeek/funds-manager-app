class AddCommentToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :comment, :text
  end
end
