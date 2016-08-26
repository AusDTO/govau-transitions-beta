class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :wizard, foreign_key: true
      t.string :type
      t.string :title
      t.jsonb :meta

      t.timestamps
    end
  end
end
