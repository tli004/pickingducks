class User < ActiveRecord::Base
  has_many :bets, :order => 'created_at DESC'
  has_many :parlays, :order => 'created_at DESC'
  has_many :purchases, :order => 'created_at DESC'
  
  attr_accessor :password
  attr_accessible :profile_pic, :bio, :dob, :email, :first_name, :active, :last_name, :password, :password_confirmation, :secret_answer, :secret_question, :username, :accept_terms, :wins, :losses, :ties, :bankroll
  
   has_attached_file :profile_pic, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "/images/missing.jpg"
   
  before_create :encrypt_password
  before_create :assign_win_percentage  
  before_create { generate_token(:auth_token) }
  
  validates_presence_of :password, :on => :create
  validates_presence_of :accept_terms
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def assign_win_percentage
    self.win_percentage = wins.to_f / (wins + losses + ties)
  end
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.pwd_hash == BCrypt::Engine.hash_secret(password, user.pwd_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    self.pwd_salt = BCrypt::Engine.generate_salt
    self.pwd_hash = BCrypt::Engine.hash_secret(password, pwd_salt)
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def self.search(search)
    if search
      where('username LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
