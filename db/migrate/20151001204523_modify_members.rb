class ModifyMembers < ActiveRecord::Migration
  def change
  	drop_table :members

    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_index :members, :email, unique: true
  end
end
