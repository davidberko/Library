class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.date :published_at
      t.text :synopsis

      t.timestamps
    end
  end
end
