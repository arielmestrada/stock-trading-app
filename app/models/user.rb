class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable  
         
  has_many :stocks, dependent: :destroy
  has_many :transactions, dependent: :destroy

  before_save :skip_devise_email
  after_create :send_confirm_to_admins
  after_create :send_affirm_to_user
  after_save :send_confirm_to_user, :if => proc {|obj| obj.saved_change_to_confirmed_at? }

  def skip_devise_email
    self.skip_confirmation_notification!
  end

  def send_confirm_to_admins
    @user = self
    UserMailer.admin_confirmation(@user).deliver_later
  end

  def send_affirm_to_user
    @user = self
    UserMailer.user_affirmation(@user).deliver_later
  end

  def send_confirm_to_user
    @user = self
    UserMailer.user_confirmation(@user).deliver_later
  end

end
