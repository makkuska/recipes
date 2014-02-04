require 'spec_helper'

describe 'people page' do
  let!(:person) { Person.create!(name: 'Markétka') }
  it 'shows a list' do
    visit people_path
    within 'ul#people-list' do
      expect(page).to have_content person.name
    end
    p page.body
  end
end
