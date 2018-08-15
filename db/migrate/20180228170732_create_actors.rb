class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :body
      t.belongs_to :film, foreign_key: true

      t.timestamps
    end
  end
end
