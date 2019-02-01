class Book < ApplicationRecord
  has_many :checkouts
  has_many :users, :through => :checkouts
  has_one_attached :image

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def checked_out?
    if self.copies >= 1
      print = "Still available"
    else
      print = "#{self.name} will be available again on #{self.future_available}"
    end
  end

  def unavailable
    if self.checkouts != nil
      print = "#{self.checkouts.pluck(:due_date)}"
    end
  end

  def available
    if self.checkouts == nil
      print = "#{self.name} is available"
    end
  end

  def future_available
    if self.copies == 0
      print = "#{self.checkouts.pluck(:due_date)}"
    end
  end

  def overdue
    if Time.now >= self.due_date
    end
  end
end
