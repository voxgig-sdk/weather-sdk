# Weather SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

WeatherUtility.registrar = ->(u) {
  u.clean = WeatherUtilities::Clean
  u.done = WeatherUtilities::Done
  u.make_error = WeatherUtilities::MakeError
  u.feature_add = WeatherUtilities::FeatureAdd
  u.feature_hook = WeatherUtilities::FeatureHook
  u.feature_init = WeatherUtilities::FeatureInit
  u.fetcher = WeatherUtilities::Fetcher
  u.make_fetch_def = WeatherUtilities::MakeFetchDef
  u.make_context = WeatherUtilities::MakeContext
  u.make_options = WeatherUtilities::MakeOptions
  u.make_request = WeatherUtilities::MakeRequest
  u.make_response = WeatherUtilities::MakeResponse
  u.make_result = WeatherUtilities::MakeResult
  u.make_point = WeatherUtilities::MakePoint
  u.make_spec = WeatherUtilities::MakeSpec
  u.make_url = WeatherUtilities::MakeUrl
  u.param = WeatherUtilities::Param
  u.prepare_auth = WeatherUtilities::PrepareAuth
  u.prepare_body = WeatherUtilities::PrepareBody
  u.prepare_headers = WeatherUtilities::PrepareHeaders
  u.prepare_method = WeatherUtilities::PrepareMethod
  u.prepare_params = WeatherUtilities::PrepareParams
  u.prepare_path = WeatherUtilities::PreparePath
  u.prepare_query = WeatherUtilities::PrepareQuery
  u.graphql_body = WeatherUtilities::GraphqlBody
  u.graphql_errors = WeatherUtilities::GraphqlErrors
  u.result_basic = WeatherUtilities::ResultBasic
  u.result_body = WeatherUtilities::ResultBody
  u.result_headers = WeatherUtilities::ResultHeaders
  u.transform_request = WeatherUtilities::TransformRequest
  u.transform_response = WeatherUtilities::TransformResponse
}
