# Weather SDK utility: make_context
require_relative '../core/context'
module WeatherUtilities
  MakeContext = ->(ctxmap, basectx) {
    WeatherContext.new(ctxmap, basectx)
  }
end
