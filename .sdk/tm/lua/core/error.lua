-- Weather SDK error

local WeatherError = {}
WeatherError.__index = WeatherError


function WeatherError.new(code, msg, ctx)
  local self = setmetatable({}, WeatherError)
  self.is_sdk_error = true
  self.sdk = "Weather"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function WeatherError:error()
  return self.msg
end


function WeatherError:__tostring()
  return self.msg
end


return WeatherError
