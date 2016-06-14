class User < ActiveRecord::Base
  has_one :member

  def self.search_by_name(name)
  	where("name like ?", "%#{name}%")
  end
  # def self.search_by_address(address)
  #   Member.where("address like ? ", "%#{address}%")
  # end

  scope :search_by_address, lambda {|address| joins(:member).where('members.address like ?',"%#{address}%")}


end
