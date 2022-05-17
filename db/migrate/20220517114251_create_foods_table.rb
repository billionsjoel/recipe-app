class CreateFoodsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :foods_tables do |t|

      t.timestamps
    end
  end
end
