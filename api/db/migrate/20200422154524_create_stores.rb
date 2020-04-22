class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.references :users, foreign_key: true
      t.references :videos, foreign_key: true
      t.datetime :date
      t.timestamps
    end
  end
end
