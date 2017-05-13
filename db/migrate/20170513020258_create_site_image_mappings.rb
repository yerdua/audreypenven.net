class CreateSiteImageMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :site_image_mappings do |t|
      t.string :location_key
      t.integer :photograph_id
    end
  end
end
