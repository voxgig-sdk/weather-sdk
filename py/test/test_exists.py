# Weather SDK exists test

import pytest
from weather_sdk import WeatherSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = WeatherSDK.test(None, None)
        assert testsdk is not None
