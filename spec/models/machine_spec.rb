require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do 
    it 'averages the price of all snacks in a machine' do
      @kels = Owner.create!(name: "Kelsey")
      @machine = @kels.machines.create!(location: "Brother's Basement")
      @pb_mms = Snack.create!(name: "Peanut Butter M&Ms", price: 1)
      @lays = Snack.create!(name: "Lay's Chips", price: 2)
      MachineSnack.create!(machine: @machine, snack: @pb_mms)
      MachineSnack.create!(machine: @machine, snack: @lays)
      
      expect(@machine.average_price).to eq(1.5)
    end
  end
end
