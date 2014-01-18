require 'spec_helper'

describe "people list" do
  let!(:person) { Person.create(name: 'Market') }
  let(:name) { person.name }
  let(:new_name) { 'new name' }

  def visit_people_page
    visit root_path
    click_link 'Lidé'
  end

  def within_person_record(person,&block)
    within "table#people-list" do
      within "tr#person_#{person.id}", &block
    end
  end

  it "lists all people" do
    visit_people_page

    expect(page).to have_content 'Lidé'

    within_person_record(person) do
      expect(page).to have_content name
      expect(page).to have_link 'Show'
      expect(page).to have_link 'Edit'
      expect(page).to have_link 'Destroy'
    end
  end # it "lists all people"

  it "allows us to show person" do
    visit_people_page

    within_person_record(person) do
      click_link 'Show'
    end

    expect(page).to have_content "Person #{name}"
    expect(page).to have_content "Name: #{name}"
  end

  it "allows us to edit person" do
    visit_people_page

    within_person_record(person) do
      click_link 'Edit'
    end

    expect(page).to have_content 'Editovat osobu'
    expect(page).to have_field 'Name', with: name
    expect(page).to have_button 'Update Person'

    fill_in 'Name', with: new_name
    click_button 'Update Person'
    person.reload

    expect(person.name).to eq new_name
  end

  it "allows us to delete person" do
    visit_people_page

    within_person_record(person) do
      click_link 'Destroy'
    end

    expect { Person.find(person.id) }.to raise_error ActiveRecord::RecordNotFound
  end
end
