require 'rails_helper'
require './db/seeds'

RSpec.describe FeaturedProfile, type: :model do

  describe "generating new featured profiles" do

    before do
      extend(SeedData)
      Timecop.freeze(Time.now) do
        FeaturedProfile.check_if_featured_profiles_need_refreshing
      end
    end

    it "should pick four random distinct profiles" do
      expect(FeaturedProfile.count).to eq(4)
      FeaturedProfile.all.each do |fp|
        expect(FeaturedProfile.where(profile_id: fp.profile_id).count).to eq(1) 
      end
    end

    it "should refresh the featured profiles once a day with all new profiles" do
      featured_profile_array = FeaturedProfile.all.to_a
      puts featured_profile_array.map(&:id).inspect
      expect(featured_profile_array.first.created_at).to be_truthy
      Timecop.freeze(Time.now + 25.hours) do
        FeaturedProfile.check_if_featured_profiles_need_refreshing
        puts FeaturedProfile.all.map(&:id).inspect
        expect(FeaturedProfile.all.to_a & featured_profile_array).to be_empty
      end
    end

    it "should choose two men and two women" do
      men = 0
      women = 0
      FeaturedProfile.all.each do |fp|
        if fp.profile.gender == "Male"
          men += 1
        elsif fp.profile.gender == "Female"
          women += 1
        end
      end
      expect(men).to eq(2)
      expect(women).to eq(2)
    end

  end

end
