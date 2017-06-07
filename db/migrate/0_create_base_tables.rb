class CreateBaseTables < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :hashed_password
      t.timestamps
    end

    create_table :roles do |t|
      t.references :accounts
      t.timestamps
    end
  end
end
