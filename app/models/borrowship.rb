class Borrowship < ActiveRecord::Base
  belongs_to :book
  belongs_to :borrower

  default_scope {order("created_at desc")}

  def returned
    self.returned_at = Time.now
    self.is_returned = true
    self.save
  end
end
