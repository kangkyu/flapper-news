class RenameUserInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :user, :author
  end
end
