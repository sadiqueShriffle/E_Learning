class DropColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :username

  end
end
