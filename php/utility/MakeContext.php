<?php
declare(strict_types=1);

// Weather SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class WeatherMakeContext
{
    public static function call(array $ctxmap, ?WeatherContext $basectx): WeatherContext
    {
        return new WeatherContext($ctxmap, $basectx);
    }
}
