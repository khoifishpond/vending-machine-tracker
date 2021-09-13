require 'rails_helper'

RSpec.describe 'show page' do
  before :each do
    @kels = Owner.create!(name: "Kelsey")
    @machine = @kels.machines.create!(location: "Brother's Basement")
    @pb_mms = Snack.create!(name: "Peanut Butter M&Ms", price: 2)
    @lays = Snack.create!(name: "Lay's Chips", price: 1.5)
    MachineSnack.create!(machine: @machine, snack: @pb_mms)
    MachineSnack.create!(machine: @machine, snack: @lays)
  end

  it 'lists all snacks and their prices' do 
    visit "/machines/#{@machine.id}"
    expect(page).to have_content(@pb_mms.name)
    expect(page).to have_content(@pb_mms.price)
    expect(page).to have_content(@lays.name)
    expect(page).to have_content(@lays.price)
  end
end