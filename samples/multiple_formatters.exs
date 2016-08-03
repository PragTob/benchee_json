# It is possible to use multiple formatters so that you have both the Console
# output and a csv file.
list = Enum.to_list(1..10_000)
map_fun = fn(i) -> [i, i * i] end

Benchee.run(
  %{
    formatters: [
      &Benchee.Formatters.JSON.output/1,
      &Benchee.Formatters.Console.output/1
    ],
    json: %{file: "my.json"}
  },
  %{
    "flat_map"    => fn -> Enum.flat_map(list, map_fun) end,
    "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten end
  })
