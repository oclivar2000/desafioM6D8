class AddAuthorToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :author, :string
  end
end
