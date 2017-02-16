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

FactoryGirl.define do
  factory :movie do
    title "MyString"
    synopsis "MyText"
    rent_price "9.99"
    is_rented false
  end
end
