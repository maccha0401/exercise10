class AddDefaultLikesCountToBlog < ActiveRecord::Migration[5.1]
  def change
    change_column :blogs, :likes_count, :integer, :default => 0
  end
end
