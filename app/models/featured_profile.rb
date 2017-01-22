class FeaturedProfile < ApplicationRecord
  belongs_to :profile

  def self.check_if_featured_profiles_need_refreshing
    if FeaturedProfile.count < 4 || FeaturedProfile.first.created_at + 1.days < Time.now
      choose_new_featured_profiles
    end
  end

  def self.choose_new_featured_profiles
  old_featured_customers = FeaturedProfile.all.map{|fp| fp.profile.customer}
  featured_customers = []
  men = 0
  women = 0
  FeaturedProfile.destroy_all
    while featured_customers.count < 4
      number = rand(Customer.count)
      chosen = Customer.all[number]
      unless featured_customers.include?(chosen) ||
      old_featured_customers.include?(chosen) ||
      (chosen.profile.gender == "Male" && men >= 2) ||
      (chosen.profile.gender == "Female" && women >= 2)
        featured_customers << chosen
        if chosen.profile.gender == "Male"
          men += 1
        elsif chosen.profile.gender == "Female"
          women += 1
        end
      end
    end
    featured_customers.each do |fc|
      FeaturedProfile.create(profile_id: fc.profile.id)
    end
  end


end
