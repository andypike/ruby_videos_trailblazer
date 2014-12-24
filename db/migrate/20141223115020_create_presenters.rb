class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.string :name, :null => false, :default => ""

      t.timestamps
    end
  end
end
