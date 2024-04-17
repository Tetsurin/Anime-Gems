class CreateGenres < ActiveRecord::Migration[7.1]
  def up
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end

    create_table :animes_genres, id: false do |t|
      t.belongs_to :anime
      t.belongs_to :genre
    end
  end

  def down
    drop_table :genres
    drop_table :animes_genres
  end
end
