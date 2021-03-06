# encoding: UTF-8
require "spec_helper"

module AuthenticationHelper
  def auth_omniauth(provider, user_info = {})
    user_info = { name: "Juquinha da Rocha", email: "juquinha@caixadeideias.com.br" }.merge(user_info)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new(
       :provider => provider,
       :uid => '123123',
       :info => user_info,
       :credentials => {
         :token => "qweqwe"
       }
     )
  end

  def sign_in_via(provider, attrs = {})
    user = auth_omniauth(provider, attrs)

    visit "/"
    click_on "Login"
    click_on "Sign in with #{provider.to_s.humanize}"
    fill_in "Password", with: "123123"
    fill_in "Password confirmation", with: "123123"
    click_on "Sign Up"

    user
  end
end
