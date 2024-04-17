class RenameColumnEpisodeNumber < ActiveRecord::Migration[7.1]
  def up
    rename_column(:animes, :episode_number, :total_episodes)
  end

  def down
    rename_column(:animes, :total_episodes, :episode_number)
  end 
end
