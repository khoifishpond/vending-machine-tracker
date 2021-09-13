require 'rails_helper'

RSpec.describe Snack do
  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks) }
  end

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

  it '#location' do
    expect(@pb_mms.locations).to eq([@machine_1.location, @machine_2.location])
  end
end