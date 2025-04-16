# Projet-IF36-P25: Call Of Data


Membres: Ahamad MOHAMMAD; Minko Bikono NEIL-JOVY; Simon GELBART; Willen AMICHE


## Introduction

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



### Tableau recapitulatif des questions et idée de graphiques/visu



------------------------------------------------------------------------

### Plan d’analyse

L’objectif de l’analyse est d’explorer les relations entre les performances sportives des clubs et leur stratégie de recrutement. Quelques questions clés guideront cette étude :

-   **Impact des transferts sur les performances** : Les clubs ayant investi massivement lors du mercato d’été 2022 ont-ils obtenu de meilleurs résultats en 2022-2023 ? Peut-on identifier une corrélation entre la valeur des joueurs recrutés et les performances collectives (ex. points, buts marqués) ?

-   **Comparaison inter-saison** : Quelles évolutions observe-t-on entre les saisons 2021-2022 et 2022-2023 ? Certains clubs ou joueurs ont-ils connu une progression ou une régression significative ?

-   **Analyse des profils de joueurs** : Existe-t-il des profils de joueurs (poste, âge, statistique-clé) qui ressortent parmi les recrues les plus fréquentes ou les plus chères ?

-   **Facteurs influents** : Quelles sont les variables les plus déterminantes dans les bonnes performances individuelles (gardiens, attaquants, milieux, etc.) ou collectives ?

-   **Visualisations exploratoires** : Scatterplots, comparatifs par club/poste/saison permettront de faire émerger des tendances.

💡 *Risques ou limites* :

- Certaines valeurs peuvent être manquantes ou imprécises.
- L’interprétation des performances est influencée par de nombreux facteurs contextuels non pris en compte (blessures, calendrier, compétitions parallèles…).

L’analyse combinera des statistiques descriptives, des comparaisons, et des visualisations dynamiques, pour aboutir à une compréhension globale des dynamiques de performance et de recrutement dans le football européen récent.
