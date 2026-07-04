<?php
declare(strict_types=1);

// Typed models for the Weather SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Weather entity data model. */
class Weather
{
    public string $description;
    public array $forecast;
    public string $temperature;
    public string $wind;
}

/** Request payload for Weather#load. */
class WeatherLoadMatch
{
    public string $id;
}

