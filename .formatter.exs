# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  import_deps: [
    :ash,
    :ash_archival,
    :ash_postgres,
    :ash_paper_trail,
    :ash_state_machine,
    :reactor
  ],
  plugins: [Spark.Formatter]
]
