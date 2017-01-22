# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module SeedData

  def self.extended(object)
    object.instance_exec do
      FeaturedProfile.destroy_all
      Message.destroy_all
      Avatar.destroy_all
      CustomerLanguage.destroy_all
      CustomerEthnicity.destroy_all
      CustomerDesire.destroy_all
      CustomerReligion.destroy_all
      Profile.destroy_all
      Customer.destroy_all
      unless Customer.find_by(email: "singleman@test.com")
        Customer.create(username: "Bob", email: "singleman@test.com", date_of_birth: "1996/07/02", password: "123456")
      end
      unless Customer.find_by(email: "singlewoman@test.com")
        Customer.create(username: "Gertrude", email: "singlewoman@test.com", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "batman@cave.org")
        Customer.create(username: "Batman", email: "batman@cave.org", date_of_birth: "1939/02/19", password: "tookabullettotheparents", is_premium: true)
      end
      unless Customer.find_by(email: "ororo@xschool.org")
        Customer.create(username: "Storm", email: "aurora@xschool.org", date_of_birth: "1970/07/21", password: "wakanda")
      end
      unless Customer.find_by(email: "lightning@asgard.gov")
        Customer.create(username: "Thor", email: "lightning@asgard.gov", date_of_birth: "986/01/11", password: "mjollnir", is_premium: true)
      end
      unless Customer.find_by(email: "someone@xyz.org")
        Customer.create(username: "Someone", email: "someone@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone2@xyz.org")
        Customer.create(username: "Tina", email: "someone2@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone3@xyz.org")
        Customer.create(username: "Frank", email: "someone3@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone4@xyz.org")
        Customer.create(username: "Corey", email: "someone4@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone5@xyz.org")
        Customer.create(username: "Trevor", email: "someone5@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone6@xyz.org")
        Customer.create(username: "Bjork", email: "someone6@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      unless Customer.find_by(email: "someone7@xyz.org")
        Customer.create(username: "Xena", email: "someone7@xyz.org", date_of_birth: "1923/04/12", password: "123456")
      end
      @gertrude = Customer.find_by(username: "Gertrude")
      @tina = Customer.find_by(username: "Tina")
      @bjork = Customer.find_by(username: "Bjork")
      @xena = Customer.find_by(username: "Xena")
      @gertrude.profile.gender = "Female"
      @gertrude.profile.save
      @tina.profile.gender = "Female"
      @tina.profile.save
      @bjork.profile.gender = "Female"
      @bjork.profile.save
      @xena.profile.gender = "Female"
      @xena.profile.save

      Customer.all.each do |customer|
        Preference.create(customer: customer)
      end

      unless Language.find_by(name: "English")
        Language.create(name: "English")
      end
      unless Language.find_by(name: "French")
        Language.create(name: "French")
      end
      unless Language.find_by(name: "German")
        Language.create(name: "German")
      end
      unless Language.find_by(name: "Italian")
        Language.create(name: "Italian")
      end
      unless Language.find_by(name: "Spanish")
        Language.create(name: "Spanish")
      end
      unless Desire.find_by(name: "Long Term Dating")
        Desire.create(name: "Long Term Dating")
      end
      unless Desire.find_by(name: "Short Term Dating")
        Desire.create(name: "Short Term Dating")
      end
      unless Desire.find_by(name: "One Night Stand")
        Desire.create(name: "One Night Stand")
      end
      unless Desire.find_by(name: "Friendship")
        Desire.create(name: "Friendship")
      end
      unless Desire.find_by(name: "Friend with Benefits")
        Desire.create(name: "Friend with Benefits")
      end
      unless Religion.find_by(name: "Christianity")
        Religion.create(name: "Christianity")
      end
      unless Religion.find_by(name: "Islam")
        Religion.create(name: "Islam")
      end
      unless Religion.find_by(name: "Hinduism")
        Religion.create(name: "Hinduism")
      end
      unless Religion.find_by(name: "Buddhism")
        Religion.create(name: "Buddhism")
      end
      unless Religion.find_by(name: "Sikhism")
        Religion.create(name: "Sikhism")
      end
      unless Religion.find_by(name: "Judaism")
        Religion.create(name: "Judaism")
      end
      @european = Ethnicity.find_or_create_by(name: "European")
      @african = Ethnicity.find_or_create_by(name: "African")
      @middle_eastern = Ethnicity.find_or_create_by(name: "Middle Eastern")
      @oriental = Ethnicity.find_or_create_by(name: "Oriental")
      @south_asian = Ethnicity.find_or_create_by(name: "South Asian")
      @aboriginal = Ethnicity.find_or_create_by(name: "Aboriginal")
      @pacific_islander = Ethnicity.find_or_create_by(name: "Pacific Islander")
      @caucacian = Ethnicity.find_or_create_by(name: "Caucacian")
      @african_american = Ethnicity.find_or_create_by(name: "African American")
      @native_american = Ethnicity.find_or_create_by(name: "Native American")
      @other = Ethnicity.find_or_create_by(name: "Other")
      @gertrude.ethnicities << @oriental
      @gertrude.ethnicities << @aboriginal
      @gertrude.ethnicities << @native_american
    end
  end

end

extend SeedData if ARGV.include?("db:seed")
