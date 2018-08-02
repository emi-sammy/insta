class AddUserRefToInstagrams < ActiveRecord::Migration[5.1]
  def change
    add_reference :instagrams, :user, foreign_key: true
  end
end
