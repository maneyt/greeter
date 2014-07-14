class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.string :body, null: false
      t.belongs_to :sender, index: true, null: false
      t.belongs_to :receiver, index: true, null: false

      t.timestamps
    end
  end
end
