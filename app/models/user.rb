class User < ActiveRecord::Base
  has_many :members

  def self.search_by_name(name)
  	where("name like ?", "%#{name}%")
  end

  scope :search_by_address, lambda {|address| joins(:members).where('members.address like ?',"%#{address}%")}
  
  #search by ID
  scope :search_by_id, lambda {|user_id| joins(:members).where('members.user_id like ?',"%#{user_id}%")}
  
  #search by age
  scope :search_by_age, -> (age) { where age: age }
  
  #search by firstname
  scope :search_by_firstname, -> (firstname) { where("firstname like ?", "%#{firstname}%")}
  
  #search_by_fullname
  # scope :search_by_fullname, lambda {|full_name| joins(:members).where('members.full_name like ?',"%#{full_name}%")}
  
  # def self.search_by_address(address)
  # 	User.includes(:members).references(:members).where("members.address like ?", "%#{address}%")
  # end 

  accepts_nested_attributes_for :members, :reject_if => :all_blank,  :allow_destroy => true
end