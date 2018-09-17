class AddColumnToUsersFace < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :face, :string
  end
end
