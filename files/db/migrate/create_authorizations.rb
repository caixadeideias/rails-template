class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user
      t.string :provider
      t.string :uid

      t.timestamps
    end

    add_index :authorizations, :user_id
    add_foreign_key :authorizations, :users, :dependent => :delete
  end
end
