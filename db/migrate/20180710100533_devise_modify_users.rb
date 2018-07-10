class DeviseModifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation_token, :text
    add_column :users, :confirmed_at , :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :text
  end
end
