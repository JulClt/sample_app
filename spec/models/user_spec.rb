# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Test", :email => "test@email.com" }
  end

  it 'should create a new instance with attributes' do
  	User.create!(@attr)
  end

  it 'should require a name' do
  	user = User.new(@attr.merge({ :nom => "" }))
  	user.should_not be_valid
  end

  it 'should require an email' do
  	user = User.new(@attr.merge({ :email => "" }))
  	user.should_not be_valid
  end

  it 'should reject a too long name' do
  	long_name = 'a' * 51
  	user = User.new(@attr.merge({ :nom => long_name }))
  	user.should_not be_valid
  end

  it 'should accept valid email' do
  	emails = %w[user@example.fr THE_USER@example.bis.com user974@example.fr]
  	emails.each do |email|
  		user = User.new(@attr.merge({ :email => email }))
  		user.should be_valid
  	end
  end

  it 'should not accept an unvalid email' do
  	emails = %w[user.example,com @example.fr the.user@example.]
  	emails.each do |email|
  		user = User.new(@attr.merge({ :email => email }))
  		user.should_not be_valid
  	end
  end

  it 'should not accept a duplicate email' do
    User.create!(@attr)
    user_with_email_duplicate = User.new(@attr)
    user_with_email_duplicate.should_not be_valid
  end

  it 'should not accept a duplicate emal with case sensitive' do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_email_duplicate = User.new(@attr)
    user_with_email_duplicate.should_not be_valid
  end
end
