# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  deleted_at             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

require 'rails_helper'

RSpec.describe User, type: :model do
    context "validations" do

  	subject {build(:user)}

  	it "has a valid user" do
      expect(subject).to be_valid
  	end

  	it "has not a valid user" do
      expect(build(:invalid_user)).not_to be_valid
  	end

  	it "is not a valid name longer than 500 characters" do
  		subject.name = 'a' * 500
  		expect(subject).not_to be_valid
  	end

  end

  describe User do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_presence_of(:password) }
  end
end
