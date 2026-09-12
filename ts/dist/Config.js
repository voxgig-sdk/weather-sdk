"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'Weather',
        slug: "weather",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "http://goweather.xyz",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            weather: {},
        }
    };
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
                    "name": "id",
                    "type": "`$STRING`"
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
            "id": {
                "field": "id",
                "name": "id"
            },
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
                            "rename": {
                                "param": {
                                    "city": "id"
                                }
                            },
                            "segments": [
                                {
                                    "lit": "v2"
                                },
                                {
                                    "lit": "weather"
                                },
                                {
                                    "var": "id"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "id"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "v2",
                                "weather",
                                "{id}"
                            ]
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
                            "rename": {
                                "param": {
                                    "city": "id"
                                }
                            },
                            "segments": [
                                {
                                    "lit": "weather"
                                },
                                {
                                    "var": "id"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "id"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "weather",
                                "{id}"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map