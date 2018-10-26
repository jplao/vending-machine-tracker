require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see a list of all snacks in that vending machine' do
    machine = Machine.create(location: "Don's Mixed Drinks")
    snack_1 = machine.snacks.create(name: 'White Castle Burger', price: 3.50)
    snack_2 = machine.snacks.create(name: 'Pop Rocks', price: 1.50)
    snack_3 = machine.snacks.create(name: 'Flaming Hot Cheetos', price: 3.50)

    visit machine_path(machine)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
    expect(page).to have_content(snack_3.name)
    expect(page).to have_content(snack_3.price)
    expect(page).to have_content(2.50)
  end
end
