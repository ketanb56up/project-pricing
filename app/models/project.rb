
require_relative '../../lib/pricing_policy.rb'

class Project < ApplicationRecord

  before_save :calc_total_price!

  def calc_total_price!
    policy = PricingPolicy.find_by_name(pricing_policy)
    self.total_price = base_price.to_i + (policy ? policy.margin : 0)  
  end
end



