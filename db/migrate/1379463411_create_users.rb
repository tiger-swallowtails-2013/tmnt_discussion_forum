class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |attributes|
    attributes.string :first_name
    attributes.string :last_name
    attributes.string :email
    attributes.string :password
    attributes.string :username
    attributes.timestamps  
    end
  end
end
