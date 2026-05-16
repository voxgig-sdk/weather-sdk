# Weather SDK exists test

require "minitest/autorun"
require_relative "../Weather_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = WeatherSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
