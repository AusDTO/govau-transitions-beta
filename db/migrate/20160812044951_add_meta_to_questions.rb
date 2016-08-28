class AddMetaToQuestions < ActiveRecord::Migration[5.0]
  def change
    change_table :questions do |t|
      t.jsonb :meta
    end
  end
end
