class CreatePhotographs < ActiveRecord::Migration[5.0]
  def change
    create_table :photographs do |t|
      t.date        :taken_on
      t.string      :title
      t.attachment  :image
      t.timestamps
    end
  end
end
