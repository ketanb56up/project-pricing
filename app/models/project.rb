
require_relative '../../lib/pricing_policy.rb'

class Project < ApplicationRecord

  before_save :set_total_price

  def total_price_calc
    @policy = PricingPolicy.find_by_name(pricing_policy)
    self.save if @policy
  end

  def set_total_price
    self.total_price = base_price.to_i + @policy.margin if @policy
  end
end



