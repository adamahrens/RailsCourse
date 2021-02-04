class AddFieldsToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :short, :text
    add_column :tracks, :language, :string, default: 'English', null: false
    add_column :tracks, :level, :string, default: 'Beginner', null: false
    add_column :tracks, :price, :integer, default: 0, null: false
  end
end
