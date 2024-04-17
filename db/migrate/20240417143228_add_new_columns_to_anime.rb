class AddNewColumnsToAnime < ActiveRecord::Migration[7.1]
  def up
    add_column :animes, :background_poster, :binary
    add_column :animes, :release_status, :string
    add_column :animes, :released_episodes, :integer
    add_column :animes, :age_rating, :string
  end

  def down
    remove_column :animes, :age_rating, :enum
    remove_column :animes, :released_episodes, :integer
    remove_column :animes, :release_status, :string
    remove_column :animes, :background_poster, :binary
  end
end
