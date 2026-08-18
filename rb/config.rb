# Weather SDK configuration

module WeatherConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Weather",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "http://goweather.xyz",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "weather" => {},
        },
      },
      "entity" => {
        "weather" => {
          "fields" => [
            {
              "name" => "description",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "forecast",
              "req" => true,
              "type" => "`$ARRAY`",
            },
            {
              "name" => "temperature",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "wind",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "weather",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "Berlin",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "city",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/weather/{city}",
                  "parts" => [
                    "v2",
                    "weather",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "city" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "Berlin",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "city",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/weather/{city}",
                  "parts" => [
                    "weather",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "city" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    WeatherFeatures.make_feature(name)
  end
end
