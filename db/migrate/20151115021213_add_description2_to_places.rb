class AddDescription2ToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :description2, :string
  end
end
