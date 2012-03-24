class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :locationtext

      t.timestamps
    end
  end
end
