<?php
declare(strict_types=1);

// Weather SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class WeatherFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new WeatherBaseFeature();
            case "test":
                return new WeatherTestFeature();
            default:
                return new WeatherBaseFeature();
        }
    }
}
