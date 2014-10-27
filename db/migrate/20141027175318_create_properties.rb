class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :postcode
      t.float :rent
      t.float :cost

      t.timestamps
    end
  end
end
