class CreateResultGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :result_groups do |t|
      t.string :title
      t.string :body
      t.references :result_category, foreign_key: true

      t.timestamps
    end

    change_table :results do |t|
      t.references :container, polymorphic: true, null: true
    end
  end
end
