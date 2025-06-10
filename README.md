# Projet-IF36-P25: Call Of Data


Membres: Ahamad MOHAMMAD; Minko Bikono NEIL-JOVY; Simon GELBART; Willen AMICHE


## Introduction

Notre objectif est d’explorer l’impact des stratégies de recrutement sur les performances sportives des clubs et joueurs. En combinant des statistiques individuelles, collectives et des données de transferts, nous chercherons à identifier les tendances qui influencent la réussite des équipes sur plusieurs saisons. 

### Données

Ce projet repose sur l’exploitation de quatre jeux de données issus de la plateforme Kaggle, tous centrés autour du football professionnel européen sur les saisons 2021-2022 et 2022-2023 :

1.  **Statistiques individuelles 2021-2022**
    -   📄 `2021-2022 Football Player Stats.csv`
    -   🔗 Source : [UCL EDA 2021-22](https://www.kaggle.com/code/azminetoushikwasi/ucl-eda-viz-2021-22-players-teams/input)
    -   📊 2921 observations × 143 variables
    -   🧾 Contenu : statistiques détaillées par joueur (minutes jouées, buts, passes, dribbles, tirs, fautes, etc.), club, poste, âge, nationalité.
    -   🧩 Type de variables : mélange de numériques (int, float) et catégorielles (nom, poste, nation).
    
2.  **Statistiques par équipe 2021-2022**
    -   📄 `2021-2022 Football Team Stats.csv`
    -   🔗 Source : même que ci-dessus
    -   📊 98 observations × 20 variables
    -   🧾 Contenu : performances globales des clubs (matches joués, buts marqués/encaissés, points, classement, etc.).
    
3.  **Statistiques par équipe 2022-2023**
    -   📄 `2022-2023 Football Team Stats.csv`
    -   🔗 Source : [2022-2023 Player Stats](https://www.kaggle.com/datasets/vivovinco/20222023-football-player-stats)
    -   📊 98 observations × 20 variables
    -   🧾 Contenu similaire à celui de 2021-2022, utile pour des comparaisons inter-saisons.
    
4.  **Transferts été 2022**
    -   📄 `2022_2023_football_summer_transfers.csv`
    -   🔗 Source : [Summer Transfer Window](https://www.kaggle.com/datasets/ruslanhuretski/202223-football-summer-transfer-window)
    -   📊 2000 observations × 11 variables
    -   🧾 Contenu : nom du joueur, poste, âge, valeur de marché, pays de provenance/destination, clubs concernés et type de transfert.
    -   📂 Principalement des variables catégorielles et numériques.

Ces données permettent d’analyser à la fois les performances sportives (individuelles et collectives) et les mouvements stratégiques des clubs (transferts), dans un contexte européen de haut niveau.



### Tableau récapitulatif des questions et idées de graphiques/visu

| Question d’analyse                                                                                   | Variables principales                                        | Type de visualisation suggéré          | Objectif                                                                                 |
|--------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------|
| Quels clubs ont le plus recruté par poste ? (top 20 clubs)                                            | `club_to`, `position`                                         | Heatmap                                   | Visualiser la spécialisation des clubs par ligne de jeu                                  |
| Quels postes sont les plus valorisés sur le marché ?                                                  | `position`, `market_value`                                    | Bar chart avec écart-type                | Identifier les postes les plus chers sur le marché                                       |
| Y a-t-il une corrélation entre `xG` et `Pts` ?                                                        | `xG`, `Pts`                                                    | Scatter plot avec régression             | Tester la pertinence des modèles prédictifs                                              |
| Quel est l’impact des transferts sur l’évolution des performances entre 2021-2022 et 2022-2023 ?      | `LgRk`, `club_to`, `nb_recrues`                               | Boxplot                                   | Évaluer l’évolution des clubs suite à leur politique de recrutement                      |
| Quels sont les transferts les plus coûteux de l’été 2022 ?                                            | `name`, `fee`, `club_to`                                      | Horizontal bar chart                      | Mettre en évidence les plus gros investissements individuels                             |
| Quelle part des buts est marquée par des recrues ? (top 10 clubs)                                     | `club_to`, `Goals`, `is_recruit`                              | Horizontal bar chart                      | Évaluer la dépendance offensive aux recrues                                              |
| Quel est le rendement des recrues vs anciens ?                                                        | `Goals`, `Min`, `is_recruit`                                  | Violin plot + boxplot                     | Comparer la contribution des recrues par rapport aux anciens                             |
| Recrutement local vs international ? (top 15 pays recruteurs)                                         | `country_from`, `country_to`                                  | Grouped bar chart                         | Comparer les stratégies de recrutement selon la nationalité                              |
| Quels clubs misent sur des jeunes joueurs ?                                                           | `Squad`, `Age`, `Min`                                         | Bar chart + Lollipop chart               | Distinguer les clubs axés sur la formation                                               |
| Quelles équipes sont les plus "chanceuses" ou "malchanceuses" ?                                       | `GF`, `xG`                                                     | Bar chart trié par différence             | Identifier les écarts entre performance réelle et attendue                               |
| Les investissements ont-ils amélioré les résultats sportifs ?                                         | `fee`, `Pts`                                                  | Scatter plot avec régression             | Évaluer l’impact des transferts sur les performances                                     |
| Quels sont les meilleurs milieux de terrain en termes de création ?                                   | `Assists`, `PasAss`, `PPA`, `ScaPassLive`                     | Horizontal bar chart                      | Identifier les profils créateurs                                                         |
| Quel est le profil défensif des meilleurs défenseurs européens ?                                      | `Tkl`, `Int`, `AerWon.`, `Blocks`, `Clr`, `X90s`              | Radar chart                               | Comparer les profils défensifs selon 5 indicateurs par match                             |
| Quels clubs sont les plus dépendants de leur meilleur buteur ?                                        | `Top Team Scorer`, `GF`                                       | Horizontal bar chart                      | Mesurer la concentration du scoring                                                      |
| Quelle est la valeur marchande totale par ligue/pays d’origine ?                                      | `fee`, `league_from`, `country_from`                          | Carte choroplèthe + bar chart             | Identifier les ligues les plus chères du marché                                          |
| Quels pays ont attiré les joueurs les plus chers ?                                        | `fee`, `country_to`                                           | Carte proportionnelle                     | Visualiser la répartition géographique des investissements                                |
| Quels clubs contribuent le plus à l’efficacité offensive de leur pays ?                               | `club`, `GF`, `pays`                                          | Pie chart ou bar chart empilé             | Analyser la concentration des buts au sein des ligues                                    |


------------------------------------------------------------------------

### Plan d’analyse

L’objectif de l’analyse est d’explorer les relations entre les performances sportives des clubs et leur stratégie de recrutement. Quelques questions clés guideront cette étude :

-   **Impact des transferts sur les performances** : Les clubs ayant investi massivement lors du mercato d’été 2022 ont-ils obtenu de meilleurs résultats en 2022-2023 ? Peut-on identifier une corrélation entre la valeur des joueurs recrutés et les performances collectives (ex. points, buts marqués) ?

-   **Comparaison inter-saison** : Quelles évolutions observe-t-on entre les saisons 2021-2022 et 2022-2023 ? Certains clubs ou joueurs ont-ils connu une progression ou une régression significative ?

-   **Analyse des profils de joueurs** : Existe-t-il des profils de joueurs (poste, âge, statistique-clé) qui ressortent parmi les recrues les plus fréquentes ou les plus chères ?

-   **Facteurs influents** : Quelles sont les variables les plus déterminantes dans les bonnes performances individuelles (gardiens, défenseurs, milieux, attaquants) ou collectives ?

-   **Visualisations exploratoires** : Scatterplots, comparatifs par club/poste/saison permettront de faire émerger des tendances.

💡 *Risques ou limites* :

- Certaines valeurs peuvent être manquantes ou imprécises.
- L’interprétation des performances est influencée par de nombreux facteurs contextuels non pris en compte (blessures, calendrier, compétitions parallèles…).

L’analyse combinera des statistiques descriptives, des comparaisons, et des visualisations dynamiques, pour aboutir à une compréhension globale des dynamiques de performance et de recrutement dans le football européen récent.
