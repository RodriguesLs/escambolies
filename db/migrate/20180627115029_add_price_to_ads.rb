class AddPriceToAds < ActiveRecord::Migration
  def change
    add_column :ads, :price, :string
  end
end
