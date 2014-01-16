require 'spec_helper'

describe "users",:type => :feature do
  before :each do
    # User.make(:email => 'user@example.com', :password => 'caplin')
  end

  it "signs me in" do
    visit '/people'
    # within("#session") do
    #   fill_in 'Login', :with => 'user@example.com'
    #   fill_in 'Password', :with => 'password'
    # end
    # click_link 'Sign in'
    expect(page).to have_content 'Lidé'
    binding.pry
    p page
  end
end
