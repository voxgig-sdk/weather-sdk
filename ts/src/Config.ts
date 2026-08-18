
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


  main = {
    name: 'Weather',
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
          "type": "`$STRING`"
        },
        {
          "name": "forecast",
          "req": true,
          "type": "`$ARRAY`"
        },
        {
          "name": "temperature",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "wind",
          "req": true,
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

