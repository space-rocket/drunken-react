ExUnit.start

Mix.Task.run "ecto.create", ~w(-r DrunkenReact.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r DrunkenReact.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(DrunkenReact.Repo)

