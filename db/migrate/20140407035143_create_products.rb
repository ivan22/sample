class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title
      t.text    :description
      t.decimal :price, precision: 6, scale: 2
    end
  end
end
