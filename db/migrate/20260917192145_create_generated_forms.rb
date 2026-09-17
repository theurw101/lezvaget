class CreateGeneratedForms < ActiveRecord::Migration[8.1]
  def change
    create_table :generated_forms do |t|
      t.references :lemma, null: false, foreign_key: true
      t.string :form
      t.string :tense
      t.string :person
      t.string :number

      t.timestamps
    end
  end
end
