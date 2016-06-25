class AddPublicEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :public_email, :boolean, after: :email, default: false
  end
end
