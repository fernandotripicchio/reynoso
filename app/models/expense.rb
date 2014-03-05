class Expense < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :expense_date, :size, :description
end
