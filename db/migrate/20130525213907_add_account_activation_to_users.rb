class AddAccountActivationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_activation_token, :string
    add_column :users, :account_activation_sent_at, :datetime
    add_column :users, :account_active, :boolean
  end
end
