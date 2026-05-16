# Weather SDK configuration

module WeatherConfig
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
        "auth" => {
          "prefix" => "Bearer",
        },
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
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "forecast",
              "req" => true,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "temperature",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "wind",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
          ],
          "name" => "weather",
          "op" => {
            "load" => {
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
                        "active" => true,
                      },
                    ],
                  },
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
                  "active" => true,
                  "index$" => 0,
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
                        "active" => true,
                      },
                    ],
                  },
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
                  "active" => true,
                  "index$" => 1,
                },
              ],
              "input" => "data",
              "key$" => "load",
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
