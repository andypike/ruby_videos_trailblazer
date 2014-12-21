class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname,  :null => false, :default => ""
      t.string :name,      :null => false, :default => ""
      t.string :image_url, :null => false, :default => ""
      t.string :provider,  :null => false
      t.string :uid,       :null => false

      t.timestamps
    end

    add_index :users, :provider
    add_index :users, :uid
  end
end
