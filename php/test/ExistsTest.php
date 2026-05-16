<?php
declare(strict_types=1);

// Weather SDK exists test

require_once __DIR__ . '/../weather_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = WeatherSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
