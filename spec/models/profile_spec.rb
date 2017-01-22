require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe 'biography' do

    before do
      @customer = Customer.create(email: "test@test.com", password: "123456")
      @customer.profile = Profile.create(biography: "about me")
    end

    describe 'update biography' do
      before do
        @customer.profile.update(biography: "more about me")
      end
      it 'should allow a user to update their profile\'s biography' do
        expect(@customer.profile.biography).to eq "more about me"
      end
    end
  end

  describe 'smoker boolean attribute' do

    it "is valid without a smoker attribute set" do
      profile = Profile.new(smoker: nil)
      expect(profile).to be_valid
    end

    it "is valid with valid attribute for smoker" do
      expect(Profile.new(smoker: true)).to be_valid
      expect(Profile.new(smoker: false)).to be_valid
    end

  end

  describe 'drinker boolean attribute' do

    it "is valid without a drinker attribute set" do
      profile = Profile.new(drinker: nil)
      expect(profile).to be_valid
    end

    it "is valid with valid attribute for drinker" do
      expect(Profile.new(drinker: true)).to be_valid
      expect(Profile.new(drinker: false)).to be_valid
    end

  end

  describe 'level_of_education string attribute' do

    it "is valid without a level_of_education attribute set" do
      profile = Profile.new(level_of_education: nil)
      expect(profile).to be_valid
    end

    it "is valid with valid attribute for level_of_education" do
      expect(Profile.new(level_of_education: 'Dumb')).to be_valid
      expect(Profile.new(level_of_education: 'Primary')).to be_valid
      expect(Profile.new(level_of_education: 'Secondary')).to be_valid
      expect(Profile.new(level_of_education: 'Further')).to be_valid
      expect(Profile.new(level_of_education: 'Higher')).to be_valid
      expect(Profile.new(level_of_education: 'Genius')).to be_valid
    end

  end
end


