class ChangeAttributeBlobColumn < ActiveRecord::Migration
  def change
    change_column :trials, :attribute_blob, :jsonb, null: false, default: '{}'
    add_index :trials, :attribute_blob, using: :gin
  end
end
