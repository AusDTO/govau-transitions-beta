class CreateResultCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :result_categories do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.string :rationale
      t.references :wizard, foreign_key: true

      t.timestamps
    end
  end
end
