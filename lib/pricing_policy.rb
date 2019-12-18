require 'open-uri'

class PricingPolicy
  attr_accessor :url, :name, :filter, :factor

  def initialize(policy_params)
    policy_params.each do |attr, value|
      send("#{attr}=".to_sym, value)
    end
  end

  def margin
    (url_data.scan(/(?=#{filter})/).count) / factor
  end

  class << self
    attr_accessor :policies

    def policy_config
      {
        flexible: {
          filter: 'a', name: 'Flexible', factor: 100,
          url: 'http://in.reuters.com'
        },
        fixed: {
          filter: 'status', name: 'Fixed', factor: 1,
          url: 'https://developer.github.com/v3/#http-redirects'
        },
        prestige: {
          filter: 'pubDate', name: 'Prestige', factor: 2,
          url: 'https://www.yourlocalguardian.co.uk/sport/rugby/rss/'
        }
      }
    end

    def all
      self.policies ||= []
      return policies unless policies.empty?

      policy_config.each do |key, policy_params|
        policies << PricingPolicy.new(policy_params)
      end

      policies
    end

    def find_by_name(name)
      all.select { |policy| policy.name.eql? name }.first
    end
  end

  private

  def url_data
    open(url).read rescue ''
  end
end
