class AddPrimaryImageToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :primary_photograph_id, :integer
  end
end
