class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    Person.create(person_params)
    redirect_to action: :index
  end

  def edit
    @person = person
  end

  def update
    person.update(person_params)
    redirect_to action: :index
  end

  def destroy
    person.destroy
    redirect_to action: :index
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end

  def person
    Person.find(id)
  end

  def id
    params.require(:id)
  end
end
