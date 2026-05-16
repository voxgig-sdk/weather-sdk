<?php
declare(strict_types=1);

// Weather SDK utility: result_body

class WeatherResultBody
{
    public static function call(WeatherContext $ctx): ?WeatherResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
