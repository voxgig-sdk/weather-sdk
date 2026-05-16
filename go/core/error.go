package core

type WeatherError struct {
	IsWeatherError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewWeatherError(code string, msg string, ctx *Context) *WeatherError {
	return &WeatherError{
		IsWeatherError: true,
		Sdk:              "Weather",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *WeatherError) Error() string {
	return e.Msg
}
