class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :sku
      t.string :name

      t.timestamps
    end
  end
end
