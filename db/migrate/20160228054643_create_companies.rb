class CreateCompanies < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :companies, id: :uuid do |t|
      t.string :name
      t.string :ticker

      t.timestamps null: false
    end
  end
end
