class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :auth_token
      t.string :auth_secret
      t.string :sms

      t.timestamps
    end
  end
end
