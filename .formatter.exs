# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  import_deps: [:ash, :reactor, :ash_postgres],
  plugins: [Spark.Formatter]
]
