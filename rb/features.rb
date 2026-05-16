# Weather SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module WeatherFeatures
  def self.make_feature(name)
    case name
    when "base"
      WeatherBaseFeature.new
    when "test"
      WeatherTestFeature.new
    else
      WeatherBaseFeature.new
    end
  end
end
