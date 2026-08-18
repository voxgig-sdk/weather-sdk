package voxgigweathersdk

import (
	"github.com/voxgig-sdk/weather-sdk/go/core"
	"github.com/voxgig-sdk/weather-sdk/go/entity"
	"github.com/voxgig-sdk/weather-sdk/go/feature"
	_ "github.com/voxgig-sdk/weather-sdk/go/utility"
)

// Type aliases preserve external API.
type WeatherSDK = core.WeatherSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type WeatherEntity = core.WeatherEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type WeatherError = core.WeatherError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewWeatherEntityFunc = func(client *core.WeatherSDK, entopts map[string]any) core.WeatherEntity {
		return entity.NewWeatherEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewWeatherSDK = core.NewWeatherSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewWeatherSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *WeatherSDK  { return NewWeatherSDK(nil) }
func Test() *WeatherSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
