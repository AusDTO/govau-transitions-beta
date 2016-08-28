class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :owner, polymorphic: true
      t.references :question
      t.string :value

      t.timestamps
    end
  end
end
