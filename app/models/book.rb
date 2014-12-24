require 'rqrcode_png'

class Book < ActiveRecord::Base
  has_many :borrowships

  default_scope {order("updated_at desc")}

  def last_borrowship
    self.borrowships.find_by(is_returned: false)
  end

  def transfer_to(borrower)
    if borrower
      if self.last_borrowship
        last = self.last_borrowship

        if last.borrower.id != borrower.id
          last.returned
          self.borrowed_by(borrower)
        end
      else
        self.borrowed_by(borrower)
      end
    end
  end

  def borrowed_by(borrower)
    if borrower
      last = self.last_borrowship
      if last
        last.returned
      end

      self.borrowships.create(book_id: self.id, borrower_id: borrower.id)

      self.available = false
      self.save
    end
  end

  def returned
    if self.last_borrowship
      self.last_borrowship.returned
    end
    self.available = true
    self.save
  end

  def qrcode(link)
    RQRCode::QRCode.new(link).to_img.resize(200, 200).to_data_url
  end
end
