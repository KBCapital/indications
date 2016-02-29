class CreateIndications < ActiveRecord::Migration
  def change
    create_table :indications, id: :uuid do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :drugs, :indication_id, :uuid
    add_index :drugs, :indication_id
  end
end
