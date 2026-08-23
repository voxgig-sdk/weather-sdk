<?php
declare(strict_types=1);

// Weather SDK configuration

class WeatherConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Weather",
                "slug" => "weather",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "http://goweather.xyz",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "weather" => [],
                ],
            ],
            "entity" => [
        'weather' => [
          'fields' => [
            [
              'name' => 'description',
              'req' => true,
              'short' => 'Description of current weather conditions',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'forecast',
              'req' => true,
              'short' => 'Weather forecast for the next 2 days',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'temperature',
              'req' => true,
              'short' => 'Current temperature with unit (°C)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'wind',
              'req' => true,
              'short' => 'Current wind speed with unit (km/h)',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'weather',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 'Berlin',
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'city',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/v2/weather/{city}',
                  'parts' => [
                    'v2',
                    'weather',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'city' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 'Berlin',
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'city',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/weather/{city}',
                  'parts' => [
                    'weather',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'city' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return WeatherFeatures::make_feature($name);
    }
}
