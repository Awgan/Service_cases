class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.datetime :data_zgloszenia
      t.string :numer
      t.string :klient
      t.string :miasto
      t.text :opis
      t.string :status
      t.string :przydzial

      t.timestamps
    end
  end
end
