library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)
library(stringr)
library(plotly)

# 💾 Importation des données (équivalent au chunk Rmd)
player_stats_2021_2022 <- read.csv("../data/2021-2022 Football Player Stats.csv", sep = ";", fileEncoding = "ISO-8859-1")
print(colnames(player_stats_2021_2022))
team_stats_2021_2022   <- read.csv("../data/2021-2022 Football Team Stats.csv", sep = ";", fileEncoding = "ISO-8859-1")
team_stats_2022_2023   <- read.csv("../data/2022-2023 Football Team Stats.csv", sep = ";", fileEncoding = "ISO-8859-1")
transfers_2022         <- read.csv("../data/2022_2023_football_summer_transfers.csv", sep = ",", fileEncoding = "UTF-8")

# Nettoyage des données de transfert (comme vu précédemment)
transfers_clean <- transfers_2022 %>%
  filter(league_from != "") %>%
  mutate(fee_num = as.numeric(str_remove_all(fee, "[^0-9.]"))) %>%
  mutate(fee_num = ifelse(is.na(fee_num), 0, fee_num))

transfers_2022$league_from <- sub("^\uFEFF", "", transfers_2022$league_from)

print(colnames(transfers_clean))


server <- function(input, output, session) {
  
  # Mise à jour dynamique des filtres dans la sidebar
  updateSelectInput(session, "ligueFilter", choices = sort(unique(transfers_clean$league_from)))
  updateSelectInput(session, "countryFilter", choices = sort(unique(transfers_clean$country_from)))
  updateSelectInput(session, "nationalityFilter",
                    choices = sort(unique(player_stats_2021_2022$Nation)),
                    selected = NULL)

  # Top ligues par nombre de transferts (pour limiter le premier graphique)
  top_ligues <- transfers_clean %>%
    count(league_from, sort = TRUE) %>%
    slice_head(n = 15) %>%
    pull(league_from)
  
  # Corriger l'encodage
  top_ligues <- iconv(top_ligues, from = "", to = "UTF-8")
  
  updateSelectInput(session, "ligueFilter", choices = sort(top_ligues))
  
  transfers_clean <- transfers_clean %>%
    left_join(player_stats_2021_2022[, c("Player", "Nation")],
              by = c("name" = "Player"))
  
  # Filtrage pour le graphique de volume (top ligues seulement)
  filtered_volume <- reactive({
    df <- transfers_clean %>%
      filter(league_from %in% top_ligues)
    
    if (!is.null(input$ligueFilter) && length(input$ligueFilter) > 0) {
      df <- df %>% filter(league_from %in% input$ligueFilter)
    }
    
    if (!is.null(input$nationalityFilter) && length(input$nationalityFilter) > 0) {
      df <- df %>% filter(Nation %in% input$nationalityFilter)
    }
    
    df
  })
  
  output$volumePlot <- renderPlotly({
    df <- filtered_volume() %>%
      group_by(league_from) %>%
      summarise(nb_transferts = n()) %>%
      arrange(desc(nb_transferts))
    
    ggplot(df, aes(x = reorder(league_from, nb_transferts), y = nb_transferts, fill = nb_transferts)) +
      geom_col() +
      coord_flip() +
      scale_fill_gradient(low = "#AED6F1", high = "#21618C") +
      labs(title = "Top 15 Ligues par volume de transferts - été 2022",
           x = "Ligue de départ",
           y = "Nombre de transferts") +
      theme_minimal(base_size = 14)
  })
  
  output$volumeTable <- renderDT({
    df <- filtered_volume() %>%
      group_by(league_from) %>%
      summarise(Nombre_de_transferts = n()) %>%
      arrange(desc(Nombre_de_transferts))
    datatable(df, options = list(pageLength = 10,lengthChange = FALSE))
  })
  
  # Récupérer uniquement les pays liés aux top ligues
  countries_top_ligues <- transfers_clean %>%
    filter(league_from %in% top_ligues) %>%
    filter(!str_detect(tolower(league_from), "2|ii|b|3|iii|c")) %>%  # garder que les premières divisions
    filter(!is.na(country_from) & country_from != "") %>%
    pull(country_from) %>%
    unique() %>%
    sort()
  
  # Met à jour dynamiquement le selectInput avec ces pays uniquement
  updateSelectInput(session, "countryFilter", choices = countries_top_ligues)
  
  filtered_valeur <- reactive({
    df <- transfers_clean %>%
      filter(league_from %in% top_ligues) %>%
      filter(!str_detect(tolower(league_from), "2|ii|b|3|iii|c"))
    
    if (!is.null(input$countryFilter) && length(input$countryFilter) > 0) {
      df <- df %>% filter(country_from %in% input$countryFilter)
    }
    
    if (!is.null(input$nationalityFilter) && length(input$nationalityFilter) > 0) {
      df <- df %>% filter(Nation %in% input$nationalityFilter)
    }
    
    df
  })
  
  output$valeurPlot <- renderPlotly({
    df <- filtered_valeur() %>%
      group_by(country_from, league_from) %>%
      summarise(valeur_totale = sum(fee_num, na.rm = TRUE)) %>%
      arrange(desc(valeur_totale)) %>%
      slice_head(n = 15)
    
    gg <- ggplot(df, aes(x = reorder(paste(league_from, "(", country_from, ")"), valeur_totale),
                         y = valeur_totale, fill = valeur_totale)) +
      geom_col() +
      coord_flip() +
      scale_fill_gradient(low = "#FAD7A0", high = "#CA6F1E") +
      labs(title = "Top 15 ligues (hors 2e/3e divisions) par valeur des transferts - été 2022",
           x = "Ligue (Pays de départ)",
           y = "Valeur totale (en millions d'euros)") +
      theme_minimal(base_size = 14)
    
    if (input$logScale) {
      gg <- gg + scale_y_log10(labels = scales::comma)
    } else {
      gg <- gg + scale_y_continuous(labels = scales::number_format(suffix = " M€", accuracy = 0.1))
    }
    
    gg
  })
  
  
  output$valeurTable <- renderDT({
    df <- filtered_valeur() %>%
      group_by(country_from, league_from) %>%
      summarise(Valeur_totale = sum(fee_num, na.rm = TRUE)) %>%
      arrange(desc(Valeur_totale)) %>%
      mutate(`Valeur totale (M€)` = paste0(round(Valeur_totale, 2), " M€")) %>%
      select(-Valeur_totale)
    
    datatable(df, options = list(pageLength = 10), 
              colnames = c("Pays de départ", "Ligue de départ", "Valeur totale (M€)"))
  })
}
