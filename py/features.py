# Weather SDK feature factory

from feature.base_feature import WeatherBaseFeature
from feature.test_feature import WeatherTestFeature


def _make_feature(name):
    features = {
        "base": lambda: WeatherBaseFeature(),
        "test": lambda: WeatherTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
