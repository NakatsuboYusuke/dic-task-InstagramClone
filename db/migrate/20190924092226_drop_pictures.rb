class DropPictures < ActiveRecord::Migration[5.2]
  def up
    drop_table :pictures
  end
  def down
    create_table :pictures do |t|
      t.text :content
      t.text :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
