require 'spec_helper'

describe 'people page' do
  let!(:person) { Person.create!(name: 'Markétka') }
  before { visit people_path }

  def within_person_item(person,&block)
    within("#people-list #person_#{person.id}",&block)
  end

  it 'shows a list of people' do
    within_person_item(person) do
      expect(page).to have_content person.name
    end
  end

  it 'allows us to delete person' do
    within_person_item(person) do
      click_link 'smazat'
    end

    expect(page).not_to have_content person.name
    expect(Person.find_by(name: person.name)).not_to be
  end

  let(:name) { 'Kuba' }

  it 'allows us to add person' do
    click_link 'přidat'
    fill_in 'Jméno', with: name
    click_button 'uložit'

    expect(page).to have_content name
    expect(Person.find_by(name: name)).to be
  end

  it "doesn't allow us to add person with no name" do
    click_link 'přidat'
    click_button 'uložit'

    puts page.body
    expect(page).to have_content "Jménoje povinná položka"
    expect(Person.find_by(name: '')).not_to be
  end

  it 'allows us to edit person' do
    within_person_item(person) do
      click_link 'upravit'
    end
    fill_in 'Jméno', with: name
    click_button 'uložit'

    expect(page).to have_content name
    expect(Person.find_by(name: name)).to be
  end

  it "doesn't allow us to change name to empty" do
    within_person_item(person) do
      click_link 'upravit'
    end
    fill_in 'Jméno', with: ''
    click_button 'uložit'

    expect(page).to have_content  "Jménoje povinná položka"
    expect(Person.find_by(name: '')).not_to be
  end
end
