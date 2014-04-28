class DefaultDisscount < ActiveRecord::Migration
  def up
    stocks = Stock.all
    stocks.each do |stock|
        stock.disccount = 0 if stock.disccount.blank?
        stock.save 
    end
  end

  def down
  end
end
