class Member < ActiveRecord::Base
  belongs_to :user
  def self.search_by_address(address)
    where("address like ? ", "%#{address}%")
  end
end
