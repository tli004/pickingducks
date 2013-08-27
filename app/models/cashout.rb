class Cashout < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :amount
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "ZIP code should be in the form 12345 or 12345-1234"
  
  attr_accessible :amount, :address1, :address2, :city, :state, :zip
  
end
