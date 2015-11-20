class AddYoutubeLinkToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :youtube_link, :string
  end
end
