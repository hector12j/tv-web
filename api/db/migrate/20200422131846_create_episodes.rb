class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.references :video, foreign_key: true
      t.integer :number
      t.timestamps
    end
  end
end
