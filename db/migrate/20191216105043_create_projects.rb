class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :base_price, default: 0
      t.integer :total_price, default: 0
      t.string :pricing_policy
      t.timestamps
    end
  end
end
