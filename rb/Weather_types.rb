# frozen_string_literal: true

# Typed models for the Weather SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Weather entity data model.
#
# @!attribute [rw] description
#   @return [String]
#
# @!attribute [rw] forecast
#   @return [Array]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] temperature
#   @return [String]
#
# @!attribute [rw] wind
#   @return [String]
Weather = Struct.new(
  :description,
  :forecast,
  :id,
  :temperature,
  :wind,
  keyword_init: true
)

# Request payload for Weather#load.
#
# @!attribute [rw] id
#   @return [String]
WeatherLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

