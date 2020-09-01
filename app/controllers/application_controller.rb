class ApplicationController < ActionController::Base
  
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  

  private
  def production?
    Rails.env.production?
  end


  def configure_permitted_parameters
    # added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :familyname_kanji, :firstname_kanji, :familyname_kana, :firstname_kana, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :familyname_kanji, :firstname_kanji, :familyname_kan, :firstname_kana, :birthday])
  end
end