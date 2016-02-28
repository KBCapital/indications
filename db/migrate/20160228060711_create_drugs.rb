class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs, id: :uuid do |t|
      t.string :name
      t.text :target
      t.text :notes
      t.uuid :company_id

      t.timestamps null: false
    end

    add_index :drugs, :company_id
  end
end
