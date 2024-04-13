class CreateAnimes < ActiveRecord::Migration[7.1]
  def up
    create_table :animes do |t|
      t.string :name
      t.string :original_name
      t.string :description
      t.binary :poster
      t.date :release_date
      t.string :content_type
      t.integer :episode_number
      t.string :studio
      t.string :director
      t.binary :logo
      t.binary :horizontal_poster

      t.timestamps
    end
  end

  def down
    drop_table :animes
  end
end
