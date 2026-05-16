<?php
declare(strict_types=1);

// Weather SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

WeatherUtility::setRegistrar(function (WeatherUtility $u): void {
    $u->clean = [WeatherClean::class, 'call'];
    $u->done = [WeatherDone::class, 'call'];
    $u->make_error = [WeatherMakeError::class, 'call'];
    $u->feature_add = [WeatherFeatureAdd::class, 'call'];
    $u->feature_hook = [WeatherFeatureHook::class, 'call'];
    $u->feature_init = [WeatherFeatureInit::class, 'call'];
    $u->fetcher = [WeatherFetcher::class, 'call'];
    $u->make_fetch_def = [WeatherMakeFetchDef::class, 'call'];
    $u->make_context = [WeatherMakeContext::class, 'call'];
    $u->make_options = [WeatherMakeOptions::class, 'call'];
    $u->make_request = [WeatherMakeRequest::class, 'call'];
    $u->make_response = [WeatherMakeResponse::class, 'call'];
    $u->make_result = [WeatherMakeResult::class, 'call'];
    $u->make_point = [WeatherMakePoint::class, 'call'];
    $u->make_spec = [WeatherMakeSpec::class, 'call'];
    $u->make_url = [WeatherMakeUrl::class, 'call'];
    $u->param = [WeatherParam::class, 'call'];
    $u->prepare_auth = [WeatherPrepareAuth::class, 'call'];
    $u->prepare_body = [WeatherPrepareBody::class, 'call'];
    $u->prepare_headers = [WeatherPrepareHeaders::class, 'call'];
    $u->prepare_method = [WeatherPrepareMethod::class, 'call'];
    $u->prepare_params = [WeatherPrepareParams::class, 'call'];
    $u->prepare_path = [WeatherPreparePath::class, 'call'];
    $u->prepare_query = [WeatherPrepareQuery::class, 'call'];
    $u->result_basic = [WeatherResultBasic::class, 'call'];
    $u->result_body = [WeatherResultBody::class, 'call'];
    $u->result_headers = [WeatherResultHeaders::class, 'call'];
    $u->transform_request = [WeatherTransformRequest::class, 'call'];
    $u->transform_response = [WeatherTransformResponse::class, 'call'];
});
