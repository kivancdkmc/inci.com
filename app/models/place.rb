# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  address        :string
#  phone_number   :string
#  contact_mail   :string
#  established_at :date
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Place < ApplicationRecord
	validates :name, :address, presence: true
	validates :phone_number, numericality: {only_integer: true}
	validates_format_of :contact_mail, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
		validate :check_established_at

	def average_rating
    #votes.average(:rating).to_s
    rating = votes.average(:rating)
    rating ? rating.to_s : "0.0"
  	end

	def check_established_at
		if established_at.present? && established_at >= Date.today
			errors.add(:established_at, "Kuruluş tarihi gecelek veya bugün olamaz!!")
		end
	end

	def self.random_places
    self.order("RANDOM()").all
  	end

	#def category
	#	Category.find(category_id)
	#end
		
		belongs_to :category
		has_many :comments, dependent: :destroy
		belongs_to :user
		has_many :votes
		has_many :voters, through: :votes, source: :user
		has_and_belongs_to_many :tags
end
