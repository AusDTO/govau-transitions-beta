class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :wizard, foreign_key: true
      t.string :type
      t.integer :order_num
      t.text :prompt

      t.timestamps
    end
  end
end
