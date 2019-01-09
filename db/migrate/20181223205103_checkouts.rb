class Checkouts < ActiveRecord::Migration[5.2]
  def change

    create_table :checkouts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.datetime :checkout_date
      t.datetime :due_date
      t.timestamps
    end
  end
end
