<?php
declare(strict_types=1);

// Weather SDK utility: result_headers

class WeatherResultHeaders
{
    public static function call(WeatherContext $ctx): ?WeatherResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
