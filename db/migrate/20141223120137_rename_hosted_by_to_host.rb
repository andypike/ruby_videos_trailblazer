class RenameHostedByToHost < ActiveRecord::Migration
  def change
    rename_column :videos, :hosted_by, :host
  end
end
