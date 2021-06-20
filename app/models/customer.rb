class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :kana_first_name, :kana_last_name,
            :residence, :phone_number,
            presence: true
            
  has_many :cart_items, dependent: :destroy

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

  # パスワードなしで登録情報を更新する機能
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
