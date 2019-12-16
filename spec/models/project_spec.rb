require 'rails_helper'

RSpec.describe Project, type: :model do
  it "create Project with filter Flexible" do
    p = Project.new(pricing_policy: "Flexible")
    p.total_price_calc
    expect(p).to be_valid
    expect(p.pricing_policy).to eq('Flexible')
  end

  it "create Project with filter Fixed" do
    p = Project.new(pricing_policy: "Fixed", base_price: 20)
    p.total_price_calc
    expect(p).to be_valid
    expect(p.pricing_policy).to eq('Fixed')
    expect(p.total_price).to eq(29)
  end

  it "create Project with filter Prestige" do
    p = Project.new(pricing_policy: "Prestige", base_price: 20)
    p.total_price_calc
    expect(p).to be_valid
    expect(p.pricing_policy).to eq('Prestige')
    expect(p.total_price).to eq(71)
  end

  it "not create Project with no policy" do
    p = Project.new(pricing_policy: "Invalid", base_price: 20)
    p.total_price_calc
    expect(p.id).to eq(nil)
  end
end
