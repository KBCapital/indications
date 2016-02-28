class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials, id: :uuid do |t|
      t.string :phase
      t.uuid :drug_id
      t.jsonb :attribute_blob

      t.timestamps null: false
    end

    add_index :trials, :drug_id
  end
end
