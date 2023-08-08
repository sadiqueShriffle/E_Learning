class AddUsernameToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :username, :string
  end
end
