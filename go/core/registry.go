package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewWeatherEntityFunc func(client *WeatherSDK, entopts map[string]any) WeatherEntity

