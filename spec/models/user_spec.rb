# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  # Test for creating a user (sign-up)
  describe 'creating a user' do
    it 'creates a new user with an email successfully' do
      user = User.new(email: 'newuser@example.com')
      expect(user.save).to be_truthy
    end
  end

  # Test for editing a user
  describe 'editing a user' do
    before do
      @user = User.create(email: 'existinguser@example.com')
    end

    it 'updates a user\'s details successfully, including username' do
      @user.update(username: 'updateduser')
      expect(@user.username).to eq('updateduser')
    end
  end

  # Test for viewing a user
  describe 'viewing a user' do
    before do
      @user = User.create(email: 'viewuser@example.com', username: 'viewuser')
    end

    it 'shows user details including username' do
      expect(@user.email).to eq('viewuser@example.com')
      expect(@user.username).to eq('viewuser')
    end
  end

  # Test for listing all users
  describe 'listing all users' do
    before do
      @user1 = User.create(email: 'user1@example.com')
      @user2 = User.create(email: 'user2@example.com')
    end

    it 'lists all users' do
      expect(User.count).to eq(2)
      expect(User.pluck(:email)).to include('user1@example.com', 'user2@example.com')
    end
  end
end
