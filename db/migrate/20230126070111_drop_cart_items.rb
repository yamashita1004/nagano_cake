class DropCartItems < ActiveRecord::Migration[6.1]
 def up
    drop_table :cart_itmes
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
