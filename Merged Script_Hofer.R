knitr::opts_chunk$set(echo = TRUE)

#setwd("C:/Users/ninausma/Desktop/data_WS2024AffComp_v2/data_adapted") #this is an option to indicate where the csv files are. 
setwd("C:/Users/zmugm1/Downloads/Data-20241226/Data")


library(tidyverse)
library(purrr)


file_list <- list.files(pattern = "*.csv", full.names = TRUE) # this command looks for csv files working directory
df_raw <- map_df(file_list, ~{
  # read in the csv file
  data <- read_csv(.x, show_col_types = FALSE) #Specify the column types or set `show_col_types = FALSE` to quiet this message
  
  # extract the id and condition from the file name
  file_name <- str_split(.x, "_", simplify = TRUE, n = 3)#[3] # extracting file name n = 3 = Maximum number of pieces to return / naming conventions was suboptimal "_"
  
  video_id <- file_name[1]
  condition <- file_name[3]
  condition <- file_name[3]
  participant_id <- file_name[2]
  video_id <- str_extract(file_name, "\\d+")[1] #any digit (\\d) and at least 1 (+)
  condition <- str_extract(file_name, "[^\\_]+")[3] #regular expression ^ matches anything but the provided characters. In this case "_". In other words this part of the code uses the str_extract function to extract a sequence of characters from the   file_name <- str_split(.x, "_", simplify = TRUE, n = 3)#[3] # extracting file name n = 3 = Maximum number of pieces to return / naming conventions was suboptimal "_"
  
  video_id <- file_name[1]
  condition <- file_name[3]
  participant_id <- file_name[2]
  video_id <- str_extract(file_name, "\\d+")[1] #any digit (\\d) and at least 1 (+)
  condition <- str_extract(file_name, "[^\\_]+")[3] #regular expression ^ matches anything but the provided characters. In this case "_". In other words this part of the code uses the str_extract function to extract a sequence of characters from the file_name. The pattern "[^\.]+" specifies that the extracted sequence should consist of one or more characters that are not a "_" . In other words, it captures everything in the file name until it encounters a dot.
  ## add the video_id and condition as additional columns
  data %>%
    dplyr::mutate(video_id = video_id, condition = condition, participant_id = participant_id)
})

df_raw <- df_raw %>%
  relocate(video_id, condition, participant_id, .after = Row)
#df_raw <- df_raw %>%
#  relocate(video_id, .before = participant_id)
#df_raw <- df_raw %>%
#  relocate(condition, .before = participant_id)
df_raw$video_id <- as.factor(df_raw$video_id)
df_raw$condition <- as.factor(df_raw$condition)
df_raw$participant_id <- as.factor(df_raw$participant_id)
#df_raw$participant_id <- as.factor(as.numeric(df_raw$participant_id))
#dropping some variables and very basic data cleaning
#str(df_raw)
#view(df_raw)
#colnames(df)

df <- subset(df_raw, select=-c(EventSource...4, SlideEvent, StimType,Duration,CollectionPhase, SourceStimuliName, EventSource...10))
df <- df[!is.na(df$SampleNumber),] #remove NA sample Numbers
df <- df[(df$Timestamp > 0),]

  df <- df[df$condition != "neutral2_",]
  sample_counts_sad <- df[df$condition=="sad",] %>% 
    group_by(video_id, condition, participant_id) %>% 
    summarise(n_samples = max(SampleNumber))
  
  filtered_ids <- sample_counts_sad %>% 
    filter(n_samples <= 6000) %>% 
    pull(video_id)
  filtered_ids
  
  df_filtered <- df %>%
    filter(!video_id %in% filtered_ids)
  df_filtered
  
  df_filtered <- df_filtered %>%
    group_by(video_id, condition) %>%
    filter(case_when(
      condition == "sad" & SampleNumber <= 6633 ~ TRUE,
      condition == "happy" & SampleNumber <= 3569 ~ TRUE,#3569,3630
      condition == "disgust" & SampleNumber <= 3609 ~ TRUE,
      condition == "neutral1" & SampleNumber <= 1781 ~ TRUE,
      TRUE ~ FALSE
    )) %>%
    ungroup()
  
  
  # read in the csv file
  data1 <- read_csv("C:/Users/zmugm1/Downloads/Data-20241226/Output Files/preprocessed_behavioral_data_complete.csv", show_col_types = FALSE) 
  View(data1)
  
  df_merged <- df_filtered %>%
    mutate(participant_id = str_to_lower(participant_id)) %>%
    inner_join(
      data1 %>% mutate(participant_code = str_to_lower(participant_code)),
      by = c("participant_id" = "participant_code")
    )
  # 
  # df_time1 <- df_merged %>%
  #   group_by(samplenumber, participant_id, condition) %>%
  #   summarise(mean_intensity = mean(sadness, na.rm = true))
  # 
  # df_time1 <- df_merged %>%
  #   mutate(openness_group = case_when(
  #     openness < 3   ~ "low",
  #     openness >= 3.5 ~ "high",
  #     true           ~ "medium"
  #   )) %>%
  #   #participant_id, 
  #   group_by(samplenumber, condition, openness_group) %>%
  #   summarise(mean_intensity = mean(surprise, na.rm = true), .groups = "drop")
  # 
  # ggplot(df_time1, aes(x = samplenumber, y = mean_intensity, color = openness_group)) +
  #   geom_line() +
  #   labs(x = "time", y = "mean intensity") +
  #   scale_color_discrete(name = "openness group") +
  #   facet_wrap(~condition,  nrow=4, scales = "free_y")  # dynamische y-achsen-skalierung
  # 
  library(zoo)
  df_time2 <- df_merged  %>%
    mutate(openness_group = case_when(
      openness < 3   ~ "lower",
      openness >= 3.5 ~ "upper",
      TRUE           ~ "medium"
    )) %>% 
    #filter( condition == 'sad' )%>% #happy disgust neutral1 sad
    #df_long <- df_filtered %>%  #I just subselect some of the emotions we have available
    gather(emotion, value, Anger, Contempt, Disgust, Fear, Joy, Sadness, Surprise, Sentimentality, Confusion, Valence)%>%
    #participant_id, 
    group_by(SampleNumber, condition, openness, openness_group, emotion) %>%
    summarise(mean_intensity = mean(value, na.rm = TRUE), .groups = "drop") %>%
    group_by(condition, openness_group, emotion) %>%  # Gruppierung für rollmean
    mutate(mean_smooth = rollmean(mean_intensity, k = 50, align = "center", fill = NA))
  # ggplot(df_time2, aes(x = SampleNumber, y = mean_intensity, color = openness_group)) +
  #   geom_line() +
  #   labs(x = "Time", y = "Mean Intensity", title = paste("Condition:", unique_condition)) +
  #   scale_color_discrete(name = "Openness Group") +
  #   facet_wrap(~emotion,  nrow=8, scales = "free_y")  # Dynamische Y-Achsen-Skalierung
  # 
  library(dplyr)
  library(ggplot2)
  library(gridExtra)
  
  # Bestimme die Emotionen, die in Plot 1 und Plot 2 dargestellt werden sollen
  emotions1 <- c("Anger", "Contempt", "Disgust", "Fear", "Sadness")   # Beispiel: die ersten 5
  emotions2 <- c("Joy", "Surprise", "Sentimentality", "Confusion", "Valence")  # Beispiel: die anderen
  
  df_disgust_filtered <- df_time2 %>%
    filter( condition == 'disgust' )%>% #happy disgust neutral1 sad
    filter(SampleNumber >= 30, SampleNumber <= 1620)
  df_sad1_filtered <- df_time2 %>%
    filter( condition == 'sad' )%>% #happy disgust neutral1 sad
    filter(SampleNumber >= 2550, SampleNumber <= 3510)
  df_sad2_filtered <- df_time2 %>%
    filter( condition == 'sad' )%>% #happy disgust neutral1 sad
    filter(SampleNumber >= 5010, SampleNumber <= 6300)
  
  every_100th_row <- function(df){
    df[seq(1, nrow(df), by = 100), ]
    }
  View(every_100th_row(df_disgust_filtered))
  
  
  
  #df_time2_plot1 <- df_time2 %>% filter(emotion %in% emotions1)
  #df_time2_plot2 <- df_time2 %>% filter(emotion %in% emotions2)
  # Für df_disgust_filtered:
  df_time2_plot1_disgust <- df_disgust_filtered %>% filter(emotion %in% emotions1)
  df_time2_plot2_disgust <- df_disgust_filtered %>% filter(emotion %in% emotions2)
  
  # Für df_sad1_filtered:
  df_time2_plot1_sad1 <- df_sad1_filtered %>% filter(emotion %in% emotions1)
  df_time2_plot2_sad1 <- df_sad1_filtered %>% filter(emotion %in% emotions2)
  
  # Für df_sad2_filtered:
  df_time2_plot1_sad2 <- df_sad2_filtered %>% filter(emotion %in% emotions1)
  df_time2_plot2_sad2 <- df_sad2_filtered %>% filter(emotion %in% emotions2)
  
  #View(head(df_time2_plot1, 100))
  #df_time2_plot1_sad1 df_time2_plot1
  ggplot(df_time2_plot1_disgust, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot1_disgust$condition)[1],""),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")
  
  
  ggplot(df_time2_plot2_disgust, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot2_disgust$condition)[1],""),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")
  ggplot(df_time2_plot1_sad1, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot1$condition)[1],"1"),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")
  
  
  ggplot(df_time2_plot2_sad1, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot1$condition)[1],"1"),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")
  ggplot(df_time2_plot1_sad2, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot1$condition)[1],"2"),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")
  
  
  ggplot(df_time2_plot2_sad2, aes(x = SampleNumber, y = mean_smooth, color = openness_group)) +
    geom_line(size = 0.7) +
    labs(
      x = "Time", 
      y = "Mean Intensity", 
      title = paste("Video:", unique(df_time2_plot1$condition)[1],"2"),
      color = "Openness Score"
    ) +
    scale_color_manual(values = c("lower" = "#3355ff",    
                                  "medium" = "#00BA38", 
                                  "upper" = "#Fd990D")) +  
    facet_wrap(~emotion, nrow = 8, scales = "free_y")

  
  #Disgust	30 - 1620
  #Sad	2550-3510
  #Sad	5010-6300
  
  
  
  # Nun möchte ich einen Zusammenhang sehen
  library(dplyr)
  
  # Funktion zur Berechnung der Korrelation zwischen openness und mean_intensity pro Emotion
  # correlation_test <- function(df) {
  #   results <- df %>%
  #     group_by(video_seq, emotion) %>%
  #     summarise(
  #      cor = cor(mean_intensity, openness, method = "pearson", use = "complete.obs"),
  #       p_value = cor.test(mean_intensity, openness, method = "pearson")$p.value
  #     )
  #   return(results)
  # }
  correlation_test <- function(df) {
    df %>%
      group_by(video_seq, emotion, openness_group) %>%
      summarise(
        cor = cor(mean_intensity, openness, method = "pearson", use = "complete.obs"),
        p_value = map_dbl(list(cor.test(mean_intensity, openness, method = "pearson")), "p.value"),
        .groups = "drop" # Entfernt das Gruppenattribut nach der Berechnung
      )
  }

  format_correlation_results <- function(df) {
    df %>%
       mutate(
        cor = round(cor, 3),  # Korrelation auf 3 Dezimalstellen runden
        p_value = round(p_value, 3),  # p-Wert auf 3 Dezimalstellen runden
        significance = ifelse(p_value < 0.05, "*", "")#,  # Wenn p < 0.05, dann *
        #p_value = paste0(p_value, significance)  # p-Wert mit * kombinieren
      )
  }
  
  df_combined <- bind_rows(
    df_disgust_filtered %>% mutate(video_seq = "disgust"),
    df_sad1_filtered %>% mutate(video_seq = "sad1"),
    df_sad2_filtered %>% mutate(video_seq = "sad2")
  )
  
  view(df_combined, n=20)
  # Berechne die Mittelwerte pro video_seq, emotion und openness_group
  df_mean1 <- df_combined %>%
    group_by(video_seq, emotion, openness_group) %>%
    summarise(mean_score = mean(mean_intensity, na.rm = TRUE), .groups = "drop")
  
  # Strukturieren in Wide-Format um, sodass jede video_seq eine Spalte wird
  df_mean_wide <- df_mean1 %>%
    pivot_wider(
      names_from = video_seq,
      values_from = mean_score
    )%>%
    mutate(across(where(is.numeric), ~ round(.x, 3)))
  
  
  # Ergebnis anzeigen
  view(df_mean_wide)
  
  
  df_cor <- format_correlation_results(correlation_test(df_combined))
  
  #Ergebnisse der Korrelation
  view(df_cor)
  
  
  library(ggplot2)
  df_cor <- df_cor %>%
    mutate(significance = ifelse(p_value < 0.05, "* significant", "not significant"))
  
  # Balkendiagramm mit Korridor für starke Korrelationen
  ggplot(df_cor, aes(x = emotion, y = cor, fill = video_seq, alpha = significance)) +
    geom_bar(stat = "identity", position = "dodge") +  # Balken pro Video-Sequenz
    geom_hline(yintercept = c(-0.5, 0.5), linetype = "dashed", color = "red") + # Korridor-Grenzen
    annotate("rect", xmin = -Inf, xmax = Inf, ymin = -0.5, ymax = 0.5, alpha = 0.1, fill = "gray") +  # Grauer Hintergrund für den Korridor
    labs(
      title = "Correlation between Openness and Emotions",
      x = "emotion",
      y = "correlation (r)",
      fill = "video sequence",
      alpha = "significance"
    ) +
    scale_alpha_manual(values = c("* significant" = 1, "not significant" = 0.3)) +  # Transparenz steuern
    theme_minimal() +
    coord_flip()  # Dreht das Diagramm für bessere Lesbarkeit
  
  
  
  
  
  
  
  
  set.seed(123)  # Reproduzierbarkeit
  
  # Funktion für Permutationstest
  permutation_test <- function(df, n_perm = 1000) {
    real_cor <- cor(df$mean_intensity, df$openness, method = "pearson", use = "complete.obs")  # Echte Korrelation
    
    perm_cor <- replicate(n_perm, {
      shuffled_openness <- sample(df$openness)  # Zufälliges Mischen von Openness
      cor(df$mean_intensity, shuffled_openness, method = "pearson", use = "complete.obs")
    })
    
    # Berechnung des p-Werts (Anteil der geshuffelten Korrelationen, die mind. so extrem sind)
    p_value <- mean(abs(perm_cor) >= abs(real_cor))
    
    # Ausgabe der Ergebnisse
    list(real_cor = real_cor, perm_cor = perm_cor, p_value = p_value)
  }
  
  # Anwendung auf ein Beispiel-Dataframe (z.B. df_disgust_filtered)
  result <- permutation_test(df_disgust_filtered, n_perm = 1000)
  
  # Ergebnisse ausgeben
  print(paste("Echte Korrelation:", round(result$real_cor, 3)))
  print(paste("Permutationstest p-Wert:", round(result$p_value, 3)))
  
  # Histogramm der permutierten Korrelationen
  ggplot(data.frame(perm_cor = result$perm_cor), aes(x = perm_cor)) +
    geom_histogram(binwidth = 0.02, fill = "gray", color = "black", alpha = 0.7) +
    geom_vline(xintercept = result$real_cor, color = "red", linetype = "dashed", linewidth = 1.2) +
    labs(
      title = "permutation test: distribution of the shuffled correlations",
      x = "correlation",
      y = "frequency"
    ) +
    theme_minimal()
  
  
  
  
  
  
  correlation_test <- function(df_disgust_filtered) {
    results <- df_disgust_filtered %>%
      group_by(emotion) %>%
      summarise(
        cor = cor(mean_intensity, openness, method = "pearson", use = "complete.obs"),
        p_value = cor.test(mean_intensity, openness, method = "pearson")$p.value
      )
    return(results)
  }
  
  # Funktion zur Durchführung einer linearen Regression pro Emotion
  regression_test <- function(df) {
    results <- df %>%
      group_by(emotion) %>%
      do(model = lm(mean_intensity ~ as.numeric(openness_group), data = .)) %>%
      summarise(
        emotion = first(emotion),
        estimate = coef(model)[2],   # Effektstärke von Openness
        p_value = summary(model)$coefficients[2,4]  # p-Wert für Openness
      )
    return(results)
  }
  
  # Regression für die drei DataFrames berechnen
  reg_disgust <- regression_test(df_disgust_filtered)
  reg_sad1 <- regression_test(df_sad1_filtered)
  reg_sad2 <- regression_test(df_sad2_filtered)
  
  # Ergebnisse anzeigen
  print(reg_disgust)
  print(reg_sad1)
  print(reg_sad2)
  