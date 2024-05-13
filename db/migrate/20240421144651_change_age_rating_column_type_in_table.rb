class ChangeAgeRatingColumnTypeInTable < ActiveRecord::Migration[7.1]
  def up
    change_column :animes, :age_rating, :binary
  end

  def down
    change_column :animes, :age_rating, :string
  end
end
