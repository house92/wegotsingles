class Customer < ApplicationRecord

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  has_one :profile

  has_one :preference

  validates :username, :date_of_birth, presence: true
  validates :username, uniqueness: true
  validate :varify_age


  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :customer_languages, inverse_of: :customer
  has_many :languages, through: :customer_languages

  has_many :customer_desires, inverse_of: :customer
  has_many :desires, through: :customer_desires

  has_many :customer_ethnicities, inverse_of: :customer, dependent: :destroy
  has_many :ethnicities, through: :customer_ethnicities

  has_many :customer_religions, inverse_of: :customer
  has_many :religions, through: :customer_religions

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :customer_languages
  accepts_nested_attributes_for :customer_desires
  accepts_nested_attributes_for :customer_ethnicities
  accepts_nested_attributes_for :customer_religions

  # has_many :sent_conversations, :foreign_key => :sender, :class_name => 'Conversation'
  # has_many :recipient_conversations, :foreign_key => :recipient, :class_name => 'Conversation'
  has_many :messages, dependent: :destroy
  has_many :sent_messages, :foreign_key => :sender, :class_name => 'Message'
  has_many :received_messages, :foreign_key => :recipient, :class_name => 'Message'

  after_create :create_starting_profile

  def new_token!
    SecureRandom.hex(16).tap do |random_token|
      ActiveRecord::Base.connection.execute("UPDATE customers SET login_token = '#{random_token}' WHERE id = #{id};")
      Rails.logger.info("Set new token for customer #{id}")
    end
  end

  private
  def varify_age
    unless self.date_of_birth.nil?
      if (self.date_of_birth.to_date + 18.years) > Date.today
        self.errors.add(:date_of_birth, "- You must be at least 18 years old to use this service")
      end
    end
  end

  def create_starting_profile
    Profile.create(customer_id: self.id, gender: "Male")
  end

  def crop_avatar
    self.profile.default_avatar.avatar.recreate_versions! if crop_x.present?
  end

end
