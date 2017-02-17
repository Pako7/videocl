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

require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  describe "::random_boolean_value" do
  	it "is expected to get  a random boolean value" do
  	  expect(Movie::random_boolean_value).to be_in([
  		  { message: 'Se completó la renta.', success: true },
  		  { message: 'No se le puede rentar porque tiene deudas.', success: false }
  	  ])
    end
  end


  context "validations" do

  	subject {build(:movie)}

  	it "has a valid movie" do
      expect(subject).to be_valid
  	end

  	it "has not a valid movie" do
      expect(build(:invalid_movie)).not_to be_valid
  	end

  	it "is not a valid title longer than 300 characters" do
  		subject.title = 'a' * 300
  		expect(subject).not_to be_valid
  	end

  	it "is not a valid synopsis longer than 20000 characters" do
  		subject.synopsis = 'a' * 20000
  		expect(subject).not_to be_valid
  	end

  	it "is not a valid rent_price greater than $ 100000 " do
  		subject.rent_price = 100000
  		expect(subject).not_to be_valid
  	end

		it "is not a valid rent_price negative " do
			subject.title = "The world"
			subject.synopsis = "The world..."
  		subject.rent_price = -100
  		expect(subject).not_to be_valid
  	end

  end

  describe Movie do
		it { is_expected.to validate_presence_of(:title) }
		it { is_expected.to validate_presence_of(:synopsis) }
		it { is_expected.to validate_presence_of(:rent_price) }
  end


end



