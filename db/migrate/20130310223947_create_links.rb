class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :description
      t.references :linkable, :polymorphic => true

      t.timestamps
    end
  end
end
