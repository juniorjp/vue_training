class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uuid, index: true
      #We wont use it for now but it may be interesting in a next release
      t.string :current_ip
      t.timestamps
    end
  end
end
