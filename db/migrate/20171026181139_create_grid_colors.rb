class CreateGridColors < ActiveRecord::Migration
  def change
    create_table :grid_colors do |t|
      t.string :box_no
      t.references :user, index: true
      t.string :color

      t.timestamps
    end
  end
end
