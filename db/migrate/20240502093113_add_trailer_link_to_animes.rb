class AddTrailerLinkToAnimes < ActiveRecord::Migration[7.1]
  def up
    add_column :animes, :trailer_link, :string
  end

  def down
    remove_column :animes, :trailer_link, :string
  end 
end
