class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :questionid
      t.string :answer
      t.integer :counter

      t.timestamps
    end
  end
end
