class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :rfc
      t.string :name
      t.string :situation
      t.date :date

      t.timestamps
    end
  end
end
