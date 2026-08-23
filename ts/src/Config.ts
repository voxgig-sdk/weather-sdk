
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'Weather',
        slug: "weather",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "http://goweather.xyz",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      weather: {
      },

    }
  }


  entity = {
    "weather": {
      "fields": [
        {
          "name": "description",
          "req": true,
          "short": "Description of current weather conditions",
          "type": "`$STRING`"
        },
        {
          "name": "forecast",
          "req": true,
          "short": "Weather forecast for the next 2 days",
          "type": "`$ARRAY`"
        },
        {
          "name": "temperature",
          "req": true,
          "short": "Current temperature with unit (°C)",
          "type": "`$STRING`"
        },
        {
          "name": "wind",
          "req": true,
          "short": "Current wind speed with unit (km/h)",
          "type": "`$STRING`"
        }
      ],
      "name": "weather",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "example": "Berlin",
                    "kind": "param",
                    "name": "id",
                    "orig": "city",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/v2/weather/{city}",
              "parts": [
                "v2",
                "weather",
                "{id}"
              ],
              "rename": {
                "param": {
                  "city": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "example": "Berlin",
                    "kind": "param",
                    "name": "id",
                    "orig": "city",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/weather/{city}",
              "parts": [
                "weather",
                "{id}"
              ],
              "rename": {
                "param": {
                  "city": "id"
                }
              },
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

