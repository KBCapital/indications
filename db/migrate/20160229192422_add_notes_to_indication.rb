class AddNotesToIndication < ActiveRecord::Migration
  def change
    add_column :indications, :notes, :text
  end
end
