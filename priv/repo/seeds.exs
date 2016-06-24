# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DrunkenReact.Repo.insert!(%DrunkenReact.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DrunkenReact.Repo
alias DrunkenReact.Widget
alias DrunkenReact.PortfolioPost

Repo.insert!(%Widget{name: "Widget One: From the Database"})
Repo.insert!(%Widget{name: "Widget Two: From the Database"})
Repo.insert!(%Widget{name: "Widget Three: From the Database"})

Repo.insert!(%PortfolioPost{name: "Portfolio Item One", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Two", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Three", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Four", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Five", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Six", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Seven", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Eight", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})
Repo.insert!(%PortfolioPost{name: "Portfolio Item Nine", image: "http://localhost:4000/images/portfolio-placeholder1@1x.png"})

