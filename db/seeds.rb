Faker::Name.name      #=> "Christophe Bartell"

=begin
Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

situation = ['Desvirtuado','Definitivo','Sentencia favorable','Presuntuo']
i = 0
10000.times do
  p i
  Company.create!(rfc: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3), name: Faker::Company.name, situation: situation.sample, date: Faker::Date.between(from: 5.years.ago, to: Date.today))
  i += 1
end
=end
Order.destroy_all
Subscription.destroy_all

Subscription.create!(sku: 'sub-mensual', name: 'Subscripción mensual', photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg', price: 100)
Subscription.create!(sku: 'sub-trimestral', name: 'Subscripción trimestral',photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg', price: 300)
Subscription.create!(sku: 'sub-anual', name: 'Subscripción anual',photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg', price: 500)
