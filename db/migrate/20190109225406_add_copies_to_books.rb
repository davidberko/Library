class AddCopiesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :copies, :integer
  end
end
