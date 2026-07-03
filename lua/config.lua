-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "Weather",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "http://goweather.xyz",
      auth = {
        prefix = "Bearer",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["weather"] = {},
      },
    },
    entity = {
      ["weather"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "description",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "forecast",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "temperature",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "wind",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
        },
        ["name"] = "weather",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["params"] = {
                    {
                      ["active"] = true,
                      ["example"] = "Berlin",
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "city",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/v2/weather/{city}",
                ["parts"] = {
                  "v2",
                  "weather",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["city"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["params"] = {
                    {
                      ["active"] = true,
                      ["example"] = "Berlin",
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "city",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/weather/{city}",
                ["parts"] = {
                  "weather",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["city"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 1,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
