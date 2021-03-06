# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  synopsis   :text(65535)
#  rent_price :decimal(10, 2)
#  is_rented  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Movie < ApplicationRecord
   mount_uploader :image, AvatarUploader
   validates :title, presence: true, length: { in: 1..100}
   validates :synopsis, presence: true, length: { in: 3..10000}
   validates :rent_price, presence: true, numericality: {greater_than: -1, less_than: 100000}
   validates :is_rented, inclusion: {in: [true,false]}
   validates :image, file_size: {less_than: 0.5.megabytes.to_i}

   class << self
   	def random_boolean_value
   	  success = [true, false].sample
      message = success ? I18n.t(:completed_rent) : I18n.t(:incompleted_rent)
      { message: message, success: success }
   	end
   end

end
