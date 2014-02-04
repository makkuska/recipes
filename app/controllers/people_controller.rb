class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to({ action: :index }, notice: 'autor vytvořen')
    else
      render :new
    end
  end

  def edit
    @person = person
  end

  def update
    @person = person
    @person.attributes = person_params

    if @person.save
      redirect_to({ action: :index }, notice: 'autor upraven')
    else
      render :edit
    end
  end

  def destroy
    person.destroy

    redirect_to({ action: :index }, notice: 'autor smazán')
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
