require 'rails_helper'

describe 'snacks show page' do
  before(:each) do
    @kels = Owner.create!(name: "Kelsey")
    @khoi = Owner.create!(name: "Khoi")
    @machine_1 = @kels.machines.create!(location: "Brother's Basement")
    @machine_2 = @khoi.machines.create!(location: "Kelsey's Bathroom")
    @pix = Snack.create!(name: "Pixie Stix", price: 1)
    @tamp = Snack.create!(name: "Tampon", price: 2)
    @pb_mms = Snack.create!(name: "Peanut Butter M&Ms", price: 2)
    @lays = Snack.create!(name: "Lay's Chips", price: 1.5)
    MachineSnack.create!(machine: @machine_1, snack: @pb_mms)
    MachineSnack.create!(machine: @machine_1, snack: @lays)
    MachineSnack.create!(machine: @machine_2, snack: @pix)
    MachineSnack.create!(machine: @machine_2, snack: @tamp)
    MachineSnack.create!(machine: @machine_2, snack: @pb_mms)
  end
  
  it 'asfasdfasdf' do
    visit "/snacks/#{@pb_mms.id}"

    expect(page).to have_content(@pb_mms.name)
    expect(page).to have_content(@pb_mms.price)
    expect(page).to have_content(@machine_1.location)
    expect(page).to have_content(@machine_1.average_price)
    expect(page).to have_content(@machine_1.count_snack)
    expect(page).to have_content(@machine_2.location)
    expect(page).to have_content(@machine_2.average_price)
    expect(page).to have_content(@machine_2.count_snack)
  end
end