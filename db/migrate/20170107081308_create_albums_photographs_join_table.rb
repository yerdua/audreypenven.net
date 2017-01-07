class CreateAlbumsPhotographsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :albums_photographs, id: false do |t|
      t.integer :album_id
      t.integer :photograph_id
    end

    add_index :albums_photographs, [:album_id, :photograph_id], unique: true
    add_index :albums_photographs, [:photograph_id, :album_id], unique: true
  end
end
