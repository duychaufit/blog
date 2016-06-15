class User < ActiveRecord::Base
  has_one :member

  def self.search_by_name(name)
  	where("name like ?", "%#{name}%")
  end

  def self.search_by_address(address)
    joins(:member).where("address like ? ", "%#{address}%")
  end

  def self.search(name=nil, address=nil)
  	User.joins(:member)
  	.where("name like ?", "%#{name}%") if name.present?
  	.where("address like ? ", "%#{address}%") if address.present?
  end

  # scope :search_by_address, lambda {|address| joins(:member).where('members.address like ?',"%#{address}%")}


end
