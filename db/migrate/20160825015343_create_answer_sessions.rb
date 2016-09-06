class CreateAnswerSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_sessions do |t|
      t.references :wizard
      t.string :token

      t.timestamps
    end
  end
end
