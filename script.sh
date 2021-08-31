# Stop at an error as each consecutive program is dependent on the prior one
set -e

# Download/replace `cameras.json` from Elgato in silent-except-error mode
curl -OsS https://www.elgato.com/sites/default/files/cameras.json

FILTER='
map(
  # Select only cameras which give clean (no UI) HDMI ouput
  select(.clean_HDMI_human_readable == "Yes")

  # Delete the `clean_HDMI_human_readable` field, it is always `true` now
  | del(.clean_HDMI_human_readable)

  # Select only cameras which can run on power indefinitely (no timer)
  | select(.unlimited_runtime_human_readable == "No")

  # Delete the `unlimited_runtime_human_readable` field, it is always `true` now
  | del(.unlimited_runtime_human_readable)

  # Delete `null` for `quality_sample`, but keep the field if it has a value
  | if .quality_sample == null then del(.quality_sample) else . end

  # Delete `null` for `setup_guide`, but keep the field if it has a value
  | if .setup_guide == null then del(.setup_guide) else . end

  # Delete `manufacturer` if it is the same as `brand` which seems to hold
  | if .manufacturer == .brand then del(.manufacturer) else . end

  # Add a name field to be able to copy-paste the manufacturer and model easily
  | .name = .brand + " " + .model
  | del(.brand, .model)

  # Delete `connection_type` as it appears to be a human readable `connection`
  | del(.connection_type)

  # Delete `not_fully_compatible` and `compatibility` as `notes` supersede it
  | del(.not_fully_compatible, .compatibility)

  # Delete `resolution` as it is redundant with respect to `max_resolution`
  | del(.resolution)

  # Add a Heureka URL field to be able to check the price quickly
  | .heureka_url = "https://digitalni-fotoaparaty.heureka.cz/"
    + (.name | gsub(" "; "-") | ascii_downcase)
)
'

# Run the filter and pretty-print the results into the terminal for debugging
# Note that `| tee results.json` can't do color terminal, but monochrome in file
jq "$FILTER" cameras.json

# Run the filter again again for the purposes of producing a monochrome output
# Note that `| tee results.json` can't do color terminal, but monochrome in file
# Write the results to a `results.json` file for when this is the final script
jq "$FILTER" cameras.json > results.json
