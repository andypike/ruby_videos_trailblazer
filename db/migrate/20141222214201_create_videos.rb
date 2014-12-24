class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title,         :null => false, :default => ""
      t.integer :presenter_id, :null => false
      t.datetime :originally_posted_on, :null => false
      t.string :original_url,  :null => false, :default => ""
      t.integer :hosted_by,    :null => false, :default => 0
      t.string :embed_url,     :null => false, :default => ""
      t.integer :status,       :null => false, :default => 0
      t.string :thumbnail,     :null => false, :default => ""

      t.timestamps
    end

    add_index :videos, :presenter_id
    add_index :videos, :status
  end
end
