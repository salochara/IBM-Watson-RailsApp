class AddPhotoUrlToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :photo_url, :string
  end
end
