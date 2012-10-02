require "spec_helper"

feature "Login" do
  scenario "Create an account without using any provider" do
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

  scenario "Login without using any provider" do
    visit "/"
    click_on "Login"
    fill_in "E-mail", with: "juquinha@caixadeideias.com.br"
    fill_in "Password", with: "123123"
    click_on "Sign In"
    page.should have_content("Signed in successfully.")
  end
end

