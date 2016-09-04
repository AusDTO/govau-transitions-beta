class CreateInterpolations < ActiveRecord::Migration[5.0]
  def change
    create_table :interpolations do |t|
      t.references :wizard
      t.references :source
      t.string :name
      t.jsonb :meta

      t.timestamps
    end
  end
end
