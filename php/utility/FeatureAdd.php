<?php
declare(strict_types=1);

// Weather SDK utility: feature_add

class WeatherFeatureAdd
{
    public static function call(WeatherContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
