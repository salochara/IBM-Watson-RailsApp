class AddPricesToSubscriptions2 < ActiveRecord::Migration[5.2]
  add_monetize :subscriptions, :price, currency: { present: false }

end
