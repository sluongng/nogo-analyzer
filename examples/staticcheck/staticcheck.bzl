SA1 = [
  "SA1002", # Invalid format in time.Parse
  "SA1004", # Suspiciously small untyped constant in time.Sleep
]

SA4 = [
  "SA4013", # Negating a boolean twice (!!b) is the same as writing b. This is either redundant, or a typo.
]

STATICCHECK_ANALYZERS = SA1 + SA4

STATICCHECK_OVERRIDE = {
  "SA4013": {
    "exclude_files": {
      "/": "excluded",
    }
  },
}
