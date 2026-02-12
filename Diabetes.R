library(ggplot2)
library(plotly)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

diabetes_data <- data.frame(
    state = c("Alabama","Alaska","Arizona","Arkansas","California","Colorado",
              "Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho",
              "Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana",
              "Maine","Maryland","Massachusetts","Michigan","Minnesota",
              "Mississippi","Missouri","Montana","Nebraska","Nevada",
              "New Hampshire","New Jersey","New Mexico","New York",
              "North Carolina","North Dakota","Ohio","Oklahoma","Oregon",
              "Pennsylvania","Rhode Island","South Carolina","South Dakota",
              "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
              "West Virginia","Wisconsin","Wyoming"),
    
    population = c(5197720,743756,7582384,3088354,39663800,5957493,
                   3675069,1051917,23839600,11297300,1446146,2001619,
                   12710158,6924275,3241488,2970606,4588372,4597740,
                   1405012,6263220,7136171,10197600,5793151,
                   2943045,6245466,1137233,2005466,3267467,
                   1409032,9500851,2130256,19867248,
                   11046024,796568,11883304,4095393,4272371,
                   13078751,1112308,5478831,924669,
                   7227750,31853800,3503613,648493,8811195,7958180,
                   1817777,5960975,587618),
    
    diabetes_cases = c(631400,48800,668300,345600,3538800,404200,
                       290100,110100,2317800,1095700,130200,146800,
                       1209700,698900,282500,257900,519100,568700,
                       130400,595400,560400,987200,468200,386700,
                       598300,85200,159200,302500,112800,773700,
                       208200,1677000,1060700,57900,1219700,385200,
                       373400,1183000,105400,635000,82800,
                       816800,2972000,194300,49900,816700,595600,
                       258500,526100,48600)
)

diabetes_data <- diabetes_data %>%
    mutate(
        diabetes_pct = round((diabetes_cases / population) * 100, 1),
        state_lower = tolower(state)
    )

us_states <- ne_states(
    country = "united states of america",
    returnclass = "sf"
) %>%
    mutate(state_lower = tolower(name)) %>%
    filter(!state_lower %in% c("district of columbia", "puerto rico"))

map_data <- us_states %>%
    left_join(diabetes_data, by = "state_lower")


p <- ggplot(map_data) +
    geom_sf(aes(
        fill = diabetes_pct,
        text = paste0(
            "<b>", state, "</b><br>",
            "Population: ", format(population, big.mark = ","), "<br>",
            "Diabetes cases: ", format(diabetes_cases, big.mark = ","), "<br>",
            "% diabetes: ", diabetes_pct, "%"
        )
    ), color = "white", size = 0.3) +
    scale_fill_gradient(
        low  = "lightblue",
        high = "darkblue",
        name = "% Diabetes"
    ) +
    labs(title = "Diabetes Prevalence by State (2025)") +
    coord_sf(
        xlim = c(-170, -60),  
        ylim = c(15, 75),    
        expand = FALSE
    ) +
    theme_minimal() +
    theme(
        axis.text  = element_blank(),
        axis.title = element_blank()
    )

interactive_map <- ggplotly(p, tooltip = "text")
interactive_map
