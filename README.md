# Weather SDK

Look up current weather and a short forecast for a city, no API key required

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Weather API

The Weather API is a small open-source REST service written in Go by [Roberto Duessmann](https://github.com/robertoduessmann/weather-api). A public instance is hosted at [goweather.xyz](https://goweather.xyz) and the source is available on GitHub under the MIT licence.

Given a city name, the API returns the current conditions and a short forecast as JSON. Each response includes:

- `temperature` — current temperature (°C)
- `wind` — wind speed (km/h)
- `description` — short text description of conditions
- `forecast` — array of upcoming days with `day`, `temperature`, and `wind`

No authentication or API key is required. The hosted instance is a community-run project and may be intermittently unavailable; for production use you can self-host the Go service from the upstream repository.

## Try it

**TypeScript**
```bash
npm install weather
```

**Python**
```bash
pip install weather-sdk
```

**PHP**
```bash
composer require voxgig/weather-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/weather-sdk/go
```

**Ruby**
```bash
gem install weather-sdk
```

**Lua**
```bash
luarocks install weather-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { WeatherSDK } from 'weather'

const client = new WeatherSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o weather-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "weather": {
      "command": "/abs/path/to/weather-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Weather** | Current weather and short forecast for a named city, served from `/v2/weather/{city}`. | `/v2/weather/{city}` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from weather_sdk import WeatherSDK

client = WeatherSDK({})


# Load a specific weather
weather, err = client.Weather(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'weather_sdk.php';

$client = new WeatherSDK([]);


// Load a specific weather
[$weather, $err] = $client->Weather(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/weather-sdk/go"

client := sdk.NewWeatherSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Weather_sdk"

client = WeatherSDK.new({})


# Load a specific weather
weather, err = client.Weather(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("weather_sdk")

local client = sdk.new({})


-- Load a specific weather
local weather, err = client:Weather(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = WeatherSDK.test()
const result = await client.Weather().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = WeatherSDK.test(None, None)
result, err = client.Weather(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = WeatherSDK::test(null, null);
[$result, $err] = $client->Weather(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Weather(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = WeatherSDK.test(nil, nil)
result, err = client.Weather(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Weather(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Weather API

- Upstream: [https://goweather.xyz](https://goweather.xyz)
- API docs: [https://github.com/robertoduessmann/weather-api](https://github.com/robertoduessmann/weather-api)

- Licensed under the MIT License via the upstream [weather-api](https://github.com/robertoduessmann/weather-api) project by Roberto Duessmann.
- Free to use, modify, and redistribute with attribution and the original licence notice.
- The hosted instance at `goweather.xyz` is provided as-is with no uptime guarantee.

---

Generated from the Weather API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
