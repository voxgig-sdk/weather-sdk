<?php
declare(strict_types=1);

// Weather SDK utility: prepare_body

class WeatherPrepareBody
{
    public static function call(WeatherContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
