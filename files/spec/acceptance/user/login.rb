require "spec_helper"

feature "Login" do
  describe "without using any provider" do
    scenario "Create an account" do
      visit "/"
      click_on "Login"
      click_on "Sign Up"
      fill_in "Name", with: "Juquinha da Rocha"
      fill_in "E-mail", with: "juquinha@caixadeideias.com.br"
      fill_in "Password", with: "123123"
      fill_in "Password confirmation", with: "Juquinha da Rocha"
      click_on "Sign Up"
      page.should have_content("Welcome! You have signed up successfully.")
    end

    scenario "Login" do
      visit "/"
      click_on "Login"
      fill_in "E-mail", with: "juquinha@caixadeideias.com.br"
      fill_in "Password", with: "123123"
      click_on "Sign In"
      page.should have_content("Signed in successfully.")
    end

    scenario "Logout" do
      sign_in User.make!
      click_on "Logout"
      page.should have_content("Signed out successfully.")
    end
  end

  describe "with Facebook" do
    scenario "Create an account" do
      sign_in_via(:facebook)
      page.should have_content("Successfully authenticated from Facebook account.")
    end

    scenario "Login" do
      auth_omniauth(:facebook, email: "juquinha@caixadeideias.com.br", password: "123123")
      visit "/"
      click_on "Login"
      click_on "Sign in with Facebook"
      page.should have_content("Successfully authenticated from Facebook account.")
    end

    scenario "Logout" do
      auth_omniauth(:facebook)
      click_on "Logout"
      page.should have_content("Signed out successfully.")
    end
  end
end
