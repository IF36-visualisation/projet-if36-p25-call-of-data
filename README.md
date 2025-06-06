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
| Les investissements ont-ils amélioré les résultats sportifs ?                                         | `fee`, `Pts`, `GF`, `GA`                                      | Scatter plot                             | Évaluer l’impact des transferts sur les performances                                     |
| Quelles équipes ont le plus progressé entre 2021-22 et 2022-23 ?                                      | `Pts`, `GD`, `xG`, `xGA` (par saison)                         | Bar chart groupé                         | Visualiser les évolutions collectives                                                    |
| Quels sont les postes les plus recrutés durant l’été 2022 ?                                           | `position`                                                    | Treemap                                  | Représenter la popularité des postes recrutés                                            |
| Quelle est la contribution des recrues en termes de buts ?                                            | `club_to`, `Goals`, `Min`                                     | Stacked bar chart                        | Quantifier la part des recrues dans l’efficacité offensive                               |
| Quels clubs ont un style de jeu basé sur la verticalité ?                                             | `PasProg`, `PasTotCmp%`, `PasAtt`                             | Radar chart                              | Comparer les styles de jeu                                                               |
| Les clubs avec plus de tirs marquent-ils plus de buts ?                                               | `Shots`, `GF`                                                 | Scatter plot                             | Évaluer la relation volume d’attaque / efficacité                                        |
| Quels clubs ont le plus renforcé leur effectif par ligne (défense, milieu, attaque) ?                | `club_to`, `position`                                         | Heatmap                                  | Analyser la répartition stratégique des renforts                                         |
| Quelle est la corrélation entre l’âge moyen des recrues et leurs performances ?                       | `age`, `Goals`, `Assists`, `Min`                              | Scatter plot                             | Étudier l’impact de l’âge sur la contribution                                            |
| Quels clubs misent sur des jeunes joueurs ?                                                           | `club_to`, `age`                                              | Boxplot                                  | Distinguer les clubs axés sur le développement                                           |
| Quels sont les meilleurs milieux de terrain en termes de création ?                                  | `Assists`, `PasAss`, `PPA`, `ScaPassLive`                     | Bar chart horizontal                     | Identifier les profils créateurs                                                         |
| Quels défenseurs sont les plus décisifs défensivement ?                                               | `Tkl`, `Int`, `Clr`, `AerWon`                                 | Radar chart                              | Valoriser les profils défensifs                                                          |
| Quels clubs sont les plus dépendants de leur meilleur buteur ?                                       | `Top Team Scorer`, `GF`                                       | Bubble chart                             | Mesurer la concentration du scoring                                                      |
| Quels joueurs ont le plus de passes progressives par poste ?                                         | `PasProg`, `Pos`                                              | Violin plot                              | Identifier les porteurs du jeu                                                           |
| Quels clubs génèrent le plus d’occasions via les dribbles ?                                          | `ScaDrib`, `DriAtt`, `DriSucc`                                | Bar chart                                | Mesurer l’impact des profils techniques                                                  |
| Y a-t-il une corrélation entre `xG` et `Pts` ?                                                        | `xG`, `Pts`, `xGD`                                            | Scatter plot avec régression             | Tester la pertinence des modèles prédictifs                                              |
| Quels clubs marquent plus que prévu selon leurs `xG` ?                                                | `GF`, `xG`                                                    | Bar chart trié par écart                 | Repérer les clubs qui surperforment ou sous-performent                                   |
| Quels joueurs ont la meilleure efficacité offensive par minute jouée ?                               | `Goals`, `Min`, `G/Sh`, `G/SoT`                               | Scatter plot                             | Identifier les profils les plus cliniques                                                |
| Quelle est la répartition des passes longues, moyennes, courtes par club ?                            | `PasLonAtt`, `PasMedAtt`, `PasShoAtt`                         | Stacked bar chart                        | Analyser les styles de construction                                                      |
| Quels clubs montrent une défense solide avec peu de fautes ?                                          | `GA`, `Fls`, `CrdY`, `Tkl`                                    | Scatter plot                             | Évaluer la rigueur défensive et la discipline                                            |
| Les clubs ayant recruté plus de joueurs ont-ils mieux performé ?                                      | `club_to`, `count_players_in`, `Pts`                           | Boxplot ou bar chart                      | Mesurer l’impact du volume de recrutement sur les performances                           |
| Quelles équipes sont les plus "chanceuses" ou "malchanceuses" ?                                       | `GF`, `xG`, `GA`, `xGA`                                        | Bar chart trié par différence             | Identifier les écarts entre performance réelle et attendue                               |
| Recrutement local vs international ? (top 15 clubs les plus actifs)                                   | `country_from`, `club_to`, `name`                              | Stacked bar chart                         | Comparer les stratégies de recrutement selon la nationalité                              |
| Quel est le rendement des recrues vs anciens ?                                                        | `Goals`, `Min`, `is_recruit`                                   | Grouped bar chart                         | Comparer la contribution des recrues par rapport aux anciens                             |
| Quelle part des buts est marquée par des recrues ? (top 10 clubs)                                     | `club_to`, `Goals`, `is_recruit`                               | Stacked bar chart                         | Évaluer la dépendance offensive aux recrues                                              |
| Quels sont les transferts les plus coûteux de l’été 2022 ?                                            | `name`, `fee`, `club_to`                                       | Horizontal bar chart                      | Mettre en évidence les plus gros investissements individuels                             |
| Quel est l’impact des transferts sur l’évolution des performances entre 2021-2022 et 2022-2023 ?      | `Pts`, `club`, `season`, `fee`                                 | Scatter plot ou évolution en ligne        | Évaluer l’évolution des clubs suite à leur politique de recrutement                      |
| Quels postes sont les plus valorisés sur le marché ?                                                  | `position`, `fee`                                              | Bar chart                                 | Identifier les postes les plus chers sur le marché                                       |
| Quels clubs ont le plus recruté par poste ? (top 20 clubs)                                            | `club_to`, `position`                                          | Heatmap                                   | Visualiser la spécialisation des clubs par ligne de jeu                                  |
| Quel est le profil défensif des meilleurs défenseurs européens ?                                      | `Player`, `Tkl`, `Int`, `AerWon.`, `Blocks`, `Clr`, `X90s`     | Radar chart                           | Comparer les profils défensifs selon 5 indicateurs normalisés par match                   |


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
