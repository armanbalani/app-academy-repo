class AddUserNameToUsers < ActiveRecord::Migration[5.2]

  def change
    change_table :users do |t|
      t.remove :name, :email
      t.string :username, null: false
    end
  end

end
