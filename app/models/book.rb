class Book < ApplicationRecord
  has_many :checkouts
  has_many :users, :through => :checkouts

  def checked_out?
    if self.checkouts == nil
      print = "still available"
    else
      print = "already checked out"
      print = "it will be available again on #{self.available}"
    end
  end

  def available
    if self.checkouts != nil
      print = "#{self.checkouts.pluck(:due_date)}"
    end
  end
end
