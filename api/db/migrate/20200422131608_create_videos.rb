class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :plot
      t.string :quality, default: "HD"
      t.float :price, default: 2.99
      t.string :type
      t.integer :number
      t.timestamps
    end
  end
end
