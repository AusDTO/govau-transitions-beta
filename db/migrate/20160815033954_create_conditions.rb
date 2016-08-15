class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.references :source
      t.references :conditional, polymorphic: true
      t.string :operator
      t.jsonb :meta

      t.timestamps
    end
  end
end
