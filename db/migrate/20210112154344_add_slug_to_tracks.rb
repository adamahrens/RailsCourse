class AddSlugToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :slug, :string
    add_index :tracks, :slug, unique: true
  end
end
