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
    title 		{Faker::Book.title}
    synopsis 	{Faker::Lorem.paragraph}
    rent_price  {Faker::Number.decimal(2)}
    image 		{Faker::Avatar.image}
    is_rented   {Faker::Boolean.boolean}
  end

  factory :invalid_movie, class: Movie do
    title 		nil
    synopsis 	nil
    rent_price  nil
    image 		nil
    is_rented   nil
  end

end
