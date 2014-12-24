class Borrower < ActiveRecord::Base
  has_many :borrowships
end
