class AddTypeToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :classification, :string, null: :false, default: 'album'
    add_index :albums, :classification
  end
end
