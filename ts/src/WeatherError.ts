
import { Context } from './Context'


class WeatherError extends Error {

  isWeatherError = true

  sdk = 'Weather'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  WeatherError
}

