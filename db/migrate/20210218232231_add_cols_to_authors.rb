class AddColsToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :password_digest, :string
    add_column :authors, :email, :string
  end
end
