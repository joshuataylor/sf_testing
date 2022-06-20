arrow_data_large = File.read!("benchmark/large_arrow")
arrow_data_small = File.read!("benchmark/small_arrow")
Benchee.run(
  %{
    "from_snowflake_arrow large" => fn ->
       Explorer.DataFrame.from_snowflake_arrow!(arrow_data_large)
       :ok
    end,
    "from_snowflake_arrow small" => fn ->
       Explorer.DataFrame.from_snowflake_arrow!(arrow_data_small)
       :ok
    end,
    "from_snowflake_arrow large to_rows" => fn ->
       Explorer.DataFrame.from_snowflake_arrow!(arrow_data_large)
       |> Explorer.DataFrame.to_rows()
       :ok
    end,
    "from_snowflake_arrow small to_rows" => fn ->
       Explorer.DataFrame.from_snowflake_arrow!(arrow_data_small)
       |> Explorer.DataFrame.to_rows()
       :ok
    end,
  },
  time: 30
)