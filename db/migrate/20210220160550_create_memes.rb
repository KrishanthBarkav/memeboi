class CreateMemes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.string :url
      t.bigint :user_id

      t.timestamps
    end
  end
end
