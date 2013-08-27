class User < ActiveRecord::Base
  has_many :bets, :order => 'created_at DESC'
  has_many :parlays, :order => 'created_at DESC'
  has_many :purchases, :order => 'created_at DESC'
  has_many :cashouts  
  
  attr_accessor :password
  attr_accessible :profile_pic, :bio, :dob, :email, :first_name, :active, :last_name, :password, :password_confirmation, :secret_answer, :secret_question, :username, :accept_terms, :wins, :losses, :ties, :bankroll, :money, :nfl_wins, :nfl_losses, :nfl_ties, :nba_wins, :nba_losses, :nba_ties, :mlb_wins, :mlb_losses, :mlb_ties, :nhl_wins, :nhl_losses, :nhl_ties, :registered, :address1, :address2, :city, :state, :zip
  
   has_attached_file :profile_pic, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "/images/missing.jpg"
   
  before_create :encrypt_password
  before_save :assign_win_percentage
  before_save :assign_nfl_win_percentage  
  before_save :assign_nba_win_percentage  
  before_save :assign_mlb_win_percentage  
  before_save :assign_nhl_win_percentage    
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
  def assign_nfl_win_percentage
    self.nfl_win_percentage = nfl_wins.to_f / (nfl_wins + nfl_losses + nfl_ties)
  end
  def assign_nba_win_percentage
    self.nba_win_percentage = nba_wins.to_f / (nba_wins + nba_losses + nba_ties)
  end
  def assign_mlb_win_percentage
    self.mlb_win_percentage = mlb_wins.to_f / (mlb_wins + mlb_losses + mlb_ties)
  end
  def assign_nhl_win_percentage
    self.nhl_win_percentage = nhl_wins.to_f / (nhl_wins + nhl_losses + nhl_ties)
  end
  def self.authenticate(email, password)
    user = find_by_email(email.downcase)
    if user && user.pwd_hash == BCrypt::Engine.hash_secret(password, user.pwd_salt)
      user
    else
      nil
    end
  end
  
  def past_week_earnings_straight
    past_week_bets = bets.where('closed_at > ? and parlay = false and pending = false ', 7.days.ago)
    total = 0
    past_week_bets.each do |bet|
      if bet.winning
        total += bet.amount
      else
        total -= bet.amount
      end
    end
    total
  end
    
  def past_week_earnings_nfl
    past_week_bets = bets.where('closed_at > ? and parlay = false and pending = false and sport = 1', 7.days.ago)
    total = 0
    past_week_bets.each do |bet|
      if bet.winning
        total += bet.amount
      else
        total -= bet.amount
      end
    end
    total
  end
  
  def past_week_earnings_nba
    past_week_bets = bets.where('closed_at > ? and parlay = false and pending = false and sport = 2', 7.days.ago)
    total = 0
    past_week_bets.each do |bet|
      if bet.winning
        total += bet.amount
      else
        total -= bet.amount
      end
    end
    total
  end
  
  def past_week_earnings_mlb
    past_week_bets = bets.where('closed_at > ? and parlay = false and pending = false and sport = 3', 7.days.ago)
    total = 0
    past_week_bets.each do |bet|
      if bet.winning
        total += bet.amount
      else
        total -= bet.amount
      end
    end
    total
  end
  
  def past_week_earnings_nhl
    past_week_bets = bets.where('closed_at > ? and parlay = false and pending = false and sport = 4', 7.days.ago)
    total = 0
    past_week_bets.each do |bet|
      if bet.winning
        total += bet.amount
      else
        total -= bet.amount
      end
    end
    total
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
