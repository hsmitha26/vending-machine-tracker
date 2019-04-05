require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "user can see the names of all snacks and their price associated with the vending machine" do
    owner_1 = Owner.create!(name: "Owner_1")
    machine_1 = owner_1.machines.create!(location: "Location 1")

    snack_1 = machine_1.snacks.create!(name: "Cheetos", price: 1.50)

    visit machine_path(machine_1)

    expect(page).to have_content("Cheetos")
  end
end
