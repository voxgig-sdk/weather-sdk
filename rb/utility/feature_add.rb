# Weather SDK utility: feature_add
module WeatherUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
