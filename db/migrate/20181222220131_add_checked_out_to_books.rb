class AddCheckedOutToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :check_out, :boolean, default: false 
  end
end
