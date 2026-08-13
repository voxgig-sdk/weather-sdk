# Weather SDK utility: make_context

from weather_sdk.core.context import WeatherContext


def make_context_util(ctxmap, basectx):
    return WeatherContext(ctxmap, basectx)
