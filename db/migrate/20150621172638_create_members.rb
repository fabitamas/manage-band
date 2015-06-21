class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :nick
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
