class AddColumnInSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :subscription_date, :date
    add_column :subscriptions, :expiration_date, :date

  end
end
