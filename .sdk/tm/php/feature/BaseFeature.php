<?php
declare(strict_types=1);

// Weather SDK base feature

class WeatherBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(WeatherContext $ctx, array $options): void {}
    public function PostConstruct(WeatherContext $ctx): void {}
    public function PostConstructEntity(WeatherContext $ctx): void {}
    public function SetData(WeatherContext $ctx): void {}
    public function GetData(WeatherContext $ctx): void {}
    public function GetMatch(WeatherContext $ctx): void {}
    public function SetMatch(WeatherContext $ctx): void {}
    public function PrePoint(WeatherContext $ctx): void {}
    public function PreSpec(WeatherContext $ctx): void {}
    public function PreRequest(WeatherContext $ctx): void {}
    public function PreResponse(WeatherContext $ctx): void {}
    public function PreResult(WeatherContext $ctx): void {}
    public function PreDone(WeatherContext $ctx): void {}
    public function PreUnexpected(WeatherContext $ctx): void {}
}
