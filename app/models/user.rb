class User < ActiveRecord::Base
  has_many :members

  def self.search_by_name(name)
  	where("name like ?", "%#{name}%")
  end

  scope :search_by_address, lambda {|address| joins(:members).where('members.address like ?',"%#{address}%")}
  # def self.search_by_address(address)
  # 	User.includes(:members).references(:members).where("members.address like ?", "%#{address}%")
  # end 

  accepts_nested_attributes_for :members, :reject_if => :all_blank,  :allow_destroy => true
end