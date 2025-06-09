library(shiny)
library(shinydashboard)
library(DT)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(title = "Analyse des transferts été 2022", titleWidth = 300),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Volume transferts", tabName = "volume", icon = icon("chart-bar")),
      menuItem("Valeur marchande", tabName = "valeur", icon = icon("money-bill-wave")),
      br(),
      selectInput("ligueFilter", "Filtrer par ligue de départ :", 
                  choices = NULL,  # initialisé dynamiquement dans server
                  selected = NULL,
                  multiple = TRUE)
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "volume",
              h2("Volume des transferts par ligue de départ"),
              plotlyOutput("volumePlot"),
              br(),
              DTOutput("volumeTable")
      ),
      tabItem(tabName = "valeur",
              h2("Valeur marchande des transferts par pays et ligue de départ"),
              sidebarLayout(
                sidebarPanel(
                  selectInput("countryFilter", "Filtrer par pays de départ :", 
                              choices = NULL,
                              selected = NULL,
                              multiple = TRUE),
                  checkboxInput("logScale", "Échelle logarithmique pour la valeur", value = TRUE)
                ),
                mainPanel(
                  plotlyOutput("valeurPlot"),
                  br(),
                  DTOutput("valeurTable")
                )
              )
      )
    )
  )
)
