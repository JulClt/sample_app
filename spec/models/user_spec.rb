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
    @attr = { 
      :nom => "Test",
      :email => "test@email.com", 
      :password => "motdepasse",
      :password_confirmation => "motdepasse"
    }
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

  it 'should not accept a duplicate email with case sensitive' do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_email_duplicate = User.new(@attr)
    user_with_email_duplicate.should_not be_valid
  end

  describe 'describe password validations' do

    it 'should have a password' do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
      should_not be_valid
    end

    it 'should have a correct password confirmation' do
      User.new(@attr.merge(:password_confirmation => "unautremotdepasse")).
      should_not be_valid
    end

    it 'should not accept a too short password' do
      short = 'a'*5
      user = User.new(@attr.merge(:password => short, :password_confirmation => short))
      user.should_not be_valid
    end

    it 'should not accept a too long password' do
      long = 'a'*41
      user = User.new(@attr.merge(:password => long, :password_confirmation => long))
      user.should_not be_valid
    end
  end

  describe 'describe password encrytped' do

    before(:each) do
      @user = User.create!(@attr)
    end

    it 'should have an attribute :encrypted_password' do
      @user.should respond_to(:encrypted_password)
    end

    it 'should not accept encrypted password blank' do
      @user.encrypted_password.should_not be_blank
    end

    describe 'has_password? method' do
      
      it 'should return true if the password is correct' do
        @user.has_password?(@attr[:password]).should be_true
      end

      it 'should return false if the password is not correct' do
        @user.has_password?('invalid').should be_false
      end      
    end

    describe 'authenticate method' do
      it 'should return nil if the password is not correct' do
        user_with_wrong_password = User.authenticate(@attr[:email], "wrongpassword")
        user_with_wrong_password.should be_nil
      end

      it 'should return nil if the email is not exist' do
        nonexistent_user = User.authenticate("exemple@aaa.fr", @attr[:password])
        nonexistent_user.should be_nil
      end  

      it 'should return the user if the email/password are correct' do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end
end
