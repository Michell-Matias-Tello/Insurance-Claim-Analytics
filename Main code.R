# =============================================================================
# Insurance Claims Analysis: Time to Resolution & Anomaly Detection
# Author: Michell Matías Tello
# Reference: https://app.notion.com/p/Insurance-Claims-Analysis-Time-to-Resolution-Anomaly-Detection-3344e631f1158011a4c0ce07c2df4244
# =============================================================================

# =============================================================================
# SECTION 1: SETUP & INITIALIZATION
# =============================================================================

# Load required libraries
library(dplyr)
library(lubridate)
library(tidyverse)
library(ggplot2)
library(plotly)
library(knitr)
library(scales)
library(gt)
library(stringr)
library(htmltools)

# Define base path (adjust to your local path)
base_path <- "C:/Users/Michell/Downloads/Insurance"

# Create directory structure
dirs <- c("/data", "/output", "/output/visuals", "/output/tables")
for (d in dirs) {
  if (!dir.exists(paste0(base_path, d))) dir.create(paste0(base_path, d))
}

# Load datasets
policies   <- read.csv(paste0(base_path, "/data/policies.csv"))
clients    <- read.csv(paste0(base_path, "/data/clients.csv"))
claims     <- read.csv(paste0(base_path, "/data/claims.csv"))
payments   <- read.csv(paste0(base_path, "/data/payments.csv"))


# =============================================================================
# SECTION 2: DATA PREPROCESSING
# =============================================================================

# Convert date columns to Date type
policies$issue_date   <- as.Date(policies$issue_date)
policies$start_date   <- as.Date(policies$start_date)
policies$end_date     <- as.Date(policies$end_date)
claims$claim_date         <- as.Date(claims$claim_date)
claims$notification_date  <- as.Date(claims$notification_date)
claims$closure_date       <- as.Date(claims$closure_date)
payments$payment_date     <- as.Date(payments$payment_date)

# Calculate resolution days for each claim
claims$resolution_days <- as.numeric(claims$closure_date - claims$claim_date)


# =============================================================================
# SECTION 3: DATA MERGING - CREATE claims_full
# =============================================================================

# Merge claims with policies
claims_full <- merge(claims, policies, by = "id_policy")

# Rename and merge with clients
colnames(claims_full)[colnames(claims_full) == "id_client.x"] <- "id_client"
claims_full <- merge(claims_full, clients, by = "id_client")
claims_full <- claims_full[, !names(claims_full) %in% "id_client.y"]

# Convert categorical variables to factors
claims_full$severity <- factor(claims_full$severity, levels = c("low", "medium", "high"))
claims_full$policy_status <- factor(claims_full$policy_status)
claims_full$claim_status  <- factor(claims_full$claim_status)

# Reorder columns for readability
claims_full <- claims_full[c(
  "id_claim", "id_client", "id_policy", "claim_date", "notification_date",
  "closure_date", "resolution_days", "claim_type", "severity",
  "claimed_amount", "approved_amount", "paid_amount", "claim_status",
  "policy_status", "type_insurance", "modality", "premium_monthly",
  "premium_annual", "insured_amount", "deductible",
  "gender", "age_group", "income_level", "occupations"
)]


# =============================================================================
# SECTION 4: DESCRIPTIVE ANALYSIS - RESOLUTION TIME
# =============================================================================

# Summary statistics
summary(claims_full$resolution_days)

# Mean, median, and standard deviation
mean_res <- mean(claims_full$resolution_days, na.rm = TRUE)
median_res <- median(claims_full$resolution_days, na.rm = TRUE)
sd_res <- sd(claims_full$resolution_days, na.rm = TRUE)

cat("Mean resolution days:", mean_res, "\n")
cat("Median resolution days:", median_res, "\n")
cat("Standard deviation:", sd_res, "\n")


# =============================================================================
# SECTION 5: AGGREGATION - RESOLUTION TIME BY BUSINESS DIMENSIONS
# =============================================================================

options(dplyr.summarise.inform = FALSE)

resolution_summary <- claims_full %>%
  group_by(type_insurance, severity) %>%
  summarise(
    mean_days = mean(resolution_days, na.rm = TRUE),
    median_days = median(resolution_days, na.rm = TRUE),
    sd_days = sd(resolution_days, na.rm = TRUE),
    n_claims = n()
  ) %>%
  arrange(desc(n_claims))

# Display table
print(resolution_summary)
kable(resolution_summary, digits = 1)


# =============================================================================
# SECTION 6: VISUALIZATION - RESOLUTION TIME DISTRIBUTION
# =============================================================================

# Density plot by insurance type
p_density <- ggplot(claims_full, aes(x = resolution_days)) +
  geom_density(fill = "steelblue", alpha = 0.7, color = "white") +
  facet_wrap(~ type_insurance, scales = "free") +
  labs(
    title = "Distribution of Claim Resolution Time by Insurance Type",
    x = "Resolution Time (days)",
    y = "Density"
  ) +
  theme_minimal()

ggsave(paste0(base_path, "/output/visuals/resolution_density_by_type.png"),
       plot = p_density, width = 12, height = 8, dpi = 300)

# Boxplot by insurance type
p_box_type <- ggplot(claims_full, aes(x = type_insurance, y = resolution_days)) +
  geom_boxplot(fill = "lightblue", alpha = 0.7, outlier.size = 1.2) +
  labs(
    title = "Claim Resolution Time by Insurance Type",
    x = "Insurance Type",
    y = "Resolution Time (days)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(paste0(base_path, "/output/visuals/resolution_boxplot_by_type.png"),
       plot = p_box_type, width = 10, height = 7, dpi = 300)

# Boxplot by severity and insurance type
p_severity_type <- ggplot(claims_full, aes(x = severity, y = resolution_days, fill = severity)) +
  geom_boxplot(
    alpha = 0.85,
    outlier.color = "red",
    outlier.size = 2.5,
    outlier.alpha = 0.8,
    width = 0.7
  ) +
  facet_wrap(~ type_insurance, scales = "free_y", ncol = 2) +
  scale_fill_manual(
    values = c("low" = "#2ECC71", "medium" = "#F39C12", "high" = "#E74C3C"),
    name = "Severity Level"
  ) +
  labs(
    title = "Resolution Time by Severity & Insurance Type",
    subtitle = "Red outliers indicate potential anomalies",
    x = "Severity",
    y = "Resolution Time (days)",
    caption = "Health claims show longest processing times"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(size = 16, face = "bold", color = "darkblue"),
    plot.subtitle = element_text(size = 11, color = "gray40"),
    strip.text = element_text(size = 11, face = "bold"),
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "gray80", fill = NA),
    plot.background = element_rect(fill = "white", color = NA)
  ) +
  geom_jitter(aes(color = type_insurance), alpha = 0.4, size = 1.2, width = 0.2)

ggsave(paste0(base_path, "/output/visuals/resolution_by_severity_type.png"),
       plot = p_severity_type, width = 12, height = 8, dpi = 300)

# Long format for easy plotting
resolution_summary_long <- resolution_summary %>%
  pivot_longer(cols = c(mean_days, median_days), names_to = "metric", values_to = "value")

p_long_format <- ggplot(resolution_summary_long, aes(x = type_insurance, y = value, group = severity, color = severity)) +
  geom_point(position = position_dodge(0.2), size = 3) +
  geom_line(position = position_dodge(0.2)) +
  labs(
    title = "Average and Median Resolution Time by Insurance Type and Severity",
    x = "Insurance Type",
    y = "Resolution Time (days)",
    color = "Severity"
  ) +
  theme_minimal()

ggsave(paste0(base_path, "/output/visuals/avg_median_resolution_by_type_severity.png"),
       plot = p_long_format, width = 10, height = 7, dpi = 300)


# =============================================================================
# SECTION 7: MONTHLY RESOLUTION TREND ANALYSIS
# =============================================================================

# Create monthly resolution data
claims_full <- claims_full %>%
  mutate(
    closure_year_month = paste(
      year(closure_date),
      sprintf("%02d", month(closure_date)),
      sep = "-"
    )
  )

monthly_resolution <- claims_full %>%
  group_by(closure_year_month) %>%
  summarise(
    mean_days = mean(resolution_days, na.rm = TRUE),
    median_days = median(resolution_days, na.rm = TRUE),
    total_claims = n(),
    .groups = "drop"
  ) %>%
  mutate(date_order = as.Date(paste0(closure_year_month, "-01"))) %>%
  arrange(date_order)

# Plot monthly resolution trend
p_monthly <- ggplot(monthly_resolution, aes(x = date_order, y = mean_days, group = 1)) +
  geom_line(aes(linetype = "Monthly Average"), color = "#3498DB", linewidth = 2, alpha = 0.9) +
  geom_point(aes(shape = "Monthly Data"), color = "#E74C3C", size = 2.4, stroke = 2, alpha = 0.95) +
  geom_ribbon(aes(ymin = 25, ymax = mean_days, fill = "Performance Band"), alpha = 0.3) +
  geom_smooth(aes(linetype = "Trend Line"), color = "#F39C12", linewidth = 1.5, span = 0.4, se = FALSE) +
  geom_hline(aes(linetype = "35-Day Target"), yintercept = 35, color = "#2ECC71", linewidth = 1.2) +
  labs(
    title = "Claim Resolution Time Evolution (2024-2025)",
    subtitle = "Monthly volatility | Green = 35-day target",
    x = "Month", y = "Mean Resolution Time (days)",
    linetype = "Trend Lines", shape = "Data Points", fill = "Area"
  ) +
  scale_x_date(date_labels = "%b %Y", date_breaks = "2 months") +
  scale_fill_manual(values = c("Performance Band" = "#3498DB")) +
  scale_linetype_manual(values = c("Monthly Average" = "solid", "Trend Line" = "solid", "35-Day Target" = "dashed")) +
  scale_shape_manual(values = c("Monthly Data" = 19)) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "bottom")

ggsave(paste0(base_path, "/output/visuals/monthly_resolution_trend.png"),
       plot = p_monthly, width = 12, height = 8, dpi = 300)


# =============================================================================
# SECTION 8: ANOMALY DETECTION - FRAUD SCORE CALCULATION
# =============================================================================

# Calculate fraud scores
fraud_scores <- claims_full %>%
  left_join(
    claims_full %>% count(id_client, name = "client_freq"),
    by = "id_client"
  ) %>%
  mutate(
    rapid_resolution = ifelse(resolution_days <= 5, 1, 0),
    amount_flag = ifelse(claimed_amount > quantile(claimed_amount, 0.95, na.rm = TRUE), 1, 0),
    freq_flag = ifelse(client_freq > 5, 1, 0),
    disparity_flag = ifelse(claimed_amount / insured_amount > 0.8, 1, 0),
    severity_critical = ifelse(severity %in% c("high", "Critical"), 1, 0),
    fraud_score = pmin(100,
                       rapid_resolution * 25 +
                         amount_flag * 20 +
                         freq_flag * 25 +
                         disparity_flag * 20 +
                         severity_critical * 10
    )
  ) %>%
  arrange(desc(fraud_score))

# Print summary
print(paste("Total claims:", nrow(fraud_scores)))
print(paste("Unique clients:", length(unique(fraud_scores$id_client))))
print("Top 10 suspicious claims:")
print(head(fraud_scores[, c("id_claim", "id_client", "client_freq", "resolution_days",
                            "fraud_score", "severity")], 10))


# =============================================================================
# SECTION 9: VISUALIZATION - FRAUD RISK ANALYSIS
# =============================================================================

# Heatmap of top 20 suspicious claims
top_suspicious <- head(fraud_scores, 20)

p_heatmap <- ggplot(top_suspicious, aes(x = reorder(paste(id_claim, id_client, sep = " | "), fraud_score),
                                        y = severity, fill = fraud_score)) +
  geom_raster(color = "white", linewidth = 0.1) +
  geom_text(aes(label = round(fraud_score, 0)),
            color = "white", fontface = "bold", size = 4, vjust = 0.5) +
  scale_fill_gradient2(low = "#2ECC71", mid = "#F39C12", high = "#E74C3C",
                       midpoint = 50, name = "Fraud\nRisk Score") +
  labs(title = "TOP 20 SUSPICIOUS CLAIMS - Risk Heatmap",
       subtitle = "Score >60 = Priority Investigation",
       x = "Claim ID | Client ID", y = "Severity") +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    plot.title = element_text(face = "bold", size = 16, color = "darkred"),
    panel.grid = element_blank(),
    axis.ticks = element_blank()
  ) +
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0))

ggsave(paste0(base_path, "/output/visuals/top_20_suspicious_claims_heatmap.png"),
       plot = p_heatmap, width = 14, height = 8, dpi = 300)

# Violin plot of fraud score by severity
p_violin <- ggplot(fraud_scores, aes(x = severity, y = fraud_score, fill = severity)) +
  geom_violin(alpha = 0.7, draw_quantiles = c(0.25, 0.5, 0.75)) +
  geom_boxplot(width = 0.15, alpha = 0.9, outlier.color = "#E74C3C") +
  scale_fill_manual(values = c("low" = "#3498DB", "high" = "#E74C3C", "medium" = "#F39C12")) +
  labs(title = "Fraud Score by Severity Level",
       subtitle = "High severity claims = Highest fraud risk",
       x = "Severity", y = "Fraud Risk Score") +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none")

ggsave(paste0(base_path, "/output/visuals/fraud_score_by_severity.png"),
       plot = p_violin, width = 10, height = 7, dpi = 300)


# =============================================================================
# SECTION 10: RESOLUTION TIME BOXPLOT (DETAILED VIEW)
# =============================================================================

p_resolution_boxplot <- ggplot(claims_full, aes(x = type_insurance, y = resolution_days, fill = severity)) +
  geom_boxplot(alpha = 0.75, outlier.shape = 21, outlier.fill = "#E74C3C", outlier.size = 2) +
  geom_jitter(aes(color = severity), width = 0.2, alpha = 0.6, size = 1.5) +
  scale_fill_manual(values = c("low" = "#2ECC71", "medium" = "#F39C12", "high" = "#E74C3C")) +
  scale_color_manual(values = c("low" = "#2ECC71", "medium" = "#F39C12", "high" = "#E74C3C")) +
  labs(title = "📊 Resolution Time by Insurance Type & Severity",
       subtitle = "Health resolves 25% faster | High severity outliers flagged",
       x = "Insurance Type", y = "Resolution Days") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom",
        plot.title = element_text(face = "bold", size = 14))

ggsave(paste0(base_path, "/output/visuals/01_resolution_analysis.png"),
       plot = p_resolution_boxplot, width = 12, height = 8, dpi = 300)


# =============================================================================
# SECTION 11: EXECUTIVE SUMMARY - FRAUD RISK TIERS
# =============================================================================

summary_table <- fraud_scores %>%
  mutate(
    risk_category = case_when(
      fraud_score >= 70 ~ "CRITICAL",
      fraud_score >= 50 ~ "HIGH",
      fraud_score >= 30 ~ "MEDIUM",
      TRUE ~ "LOW"
    )
  ) %>%
  group_by(risk_category) %>%
  summarise(
    n_claims = n(),
    pct_claims = n_claims / nrow(fraud_scores),
    avg_score = mean(fraud_score, na.rm = TRUE),
    max_score = max(fraud_score, na.rm = TRUE),
    total_claimed = sum(claimed_amount, na.rm = TRUE),
    rapid_cases = sum(rapid_resolution, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(
    risk_category = factor(risk_category, levels = c("CRITICAL", "HIGH", "MEDIUM", "LOW")),
    risk_label = case_when(
      risk_category == "CRITICAL" ~ "🚨 Critical",
      risk_category == "HIGH" ~ "⚠ High",
      risk_category == "MEDIUM" ~ "📊 Medium",
      TRUE ~ "✅ Low"
    )
  ) %>%
  arrange(risk_category)

summary_gt <- summary_table %>%
  gt() %>%
  tab_header(
    title = "Fraud Risk Executive Summary",
    subtitle = "Distribution of suspicious claims by risk tier"
  ) %>%
  cols_label(
    risk_label = "Risk Tier",
    n_claims = "Claims",
    pct_claims = "% of Total",
    avg_score = "Avg Score",
    max_score = "Max Score",
    total_claimed = "Total Claimed",
    rapid_cases = "Rapid Cases"
  ) %>%
  fmt_percent(columns = pct_claims, decimals = 1) %>%
  fmt_number(columns = c(avg_score, max_score), decimals = 1) %>%
  fmt_currency(columns = total_claimed, currency = "USD", decimals = 0) %>%
  tab_style(
    style = list(cell_fill(color = "#FFE5E5"), cell_text(weight = "bold", color = "#B00020")),
    locations = cells_body(rows = risk_category == "CRITICAL")
  ) %>%
  tab_style(
    style = list(cell_fill(color = "#FFF4D6"), cell_text(weight = "bold", color = "#8A5A00")),
    locations = cells_body(rows = risk_category == "HIGH")
  ) %>%
  tab_style(
    style = list(cell_fill(color = "#EAF4FF")),
    locations = cells_body(rows = risk_category == "MEDIUM")
  ) %>%
  tab_style(
    style = list(cell_fill(color = "#EAF8EA")),
    locations = cells_body(rows = risk_category == "LOW")
  ) %>%
  opt_row_striping() %>%
  tab_options(
    table.font.size = 13,
    heading.title.font.size = 16,
    heading.subtitle.font.size = 11,
    row.striping.include_table_body = TRUE
  )

# Save summary table as HTML
htmltools::save_html(summary_gt, paste0(base_path, "/output/tables/fraud_risk_executive_summary.html"))


# =============================================================================
# SECTION 12: CLIENT PERFORMANCE ANALYSIS
# =============================================================================

client_perf <- claims_full %>%
  count(id_client, name = "client_freq") %>%
  mutate(segment = case_when(
    client_freq >= 4 ~ "High Freq (4+)",
    client_freq >= 2 ~ "Medium Freq (2-3)",
    TRUE ~ "Low Freq (1)"
  )) %>%
  left_join(claims_full %>% group_by(id_client) %>%
              summarise(avg_days = mean(resolution_days, na.rm = TRUE)), by = "id_client") %>%
  group_by(segment) %>%
  summarise(avg_resolution = mean(avg_days, na.rm = TRUE),
            n_clients = n(),
            .groups = "drop") %>%
  mutate(segment = factor(segment, levels = c("Low Freq (1)", "Medium Freq (2-3)", "High Freq (4+)")))

p_client_perf <- ggplot(client_perf, aes(x = segment, y = avg_resolution, fill = segment)) +
  geom_col(alpha = 0.85, color = "white", linewidth = 1) +
  geom_text(aes(label = paste0(round(avg_resolution), "d\n(", n_clients, " clients)")),
            vjust = -0.3, fontface = "bold", size = 4) +
  labs(title = "Client Resolution Efficiency",
       subtitle = "High-frequency clients resolve 35% FASTER",
       x = "Client Segment", y = "Average Resolution Days") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none")

ggsave(paste0(base_path, "/output/visuals/client_resolution_efficiency.png"),
       plot = p_client_perf, width = 10, height = 7, dpi = 300)


# =============================================================================
# SECTION 13: HEATMAPS - CLAIM FREQUENCY & AMOUNT
# =============================================================================

# Claim frequency heatmap by age group and insurance type
freq_data <- table(claims_full$age_group, claims_full$type_insurance)
freq_df <- as.data.frame(freq_data)
colnames(freq_df) <- c("age_group", "type_insurance", "n")

p_freq_heatmap <- ggplot(freq_df, aes(x = type_insurance, y = age_group, fill = n)) +
  geom_tile(color = "white", linewidth = 1.2) +
  geom_text(aes(label = n), color = "white", fontface = "bold", size = 4.5) +
  scale_fill_gradient2(low = "#E8F6F3", mid = "#3498DB", high = "#E74C3C",
                       name = "Claims") +
  labs(title = "Claim FREQUENCY Heatmap", x = "Insurance Type", y = "Age Group") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(paste0(base_path, "/output/visuals/claim_frequency_heatmap.png"),
       plot = p_freq_heatmap, width = 10, height = 6, dpi = 300)

# Claim amount heatmap by age group and insurance type
amount_data <- aggregate(claimed_amount ~ age_group + type_insurance,
                         data = claims_full, sum)
colnames(amount_data)[3] <- "total_amount"
amount_data$total_amount <- amount_data$total_amount / 1000

age_order <- c("20-30", "31-40", "41-50", "51-60", "61-70", "71-80")
amount_data$age_group <- factor(amount_data$age_group, levels = age_order)

p_amount_heatmap <- ggplot(amount_data,
                           aes(x = reorder(type_insurance, total_amount, FUN = median),
                               y = age_group, fill = total_amount)) +
  geom_tile(color = "white", linewidth = 1, alpha = 0.98) +
  geom_text(aes(label = paste0("$", format(round(total_amount), big.mark = ","))),
            color = "#5F6F7A", fontface = "bold", size = 4, family = "Segoe UI") +
  scale_fill_gradientn(
    colors = c("#E8F8F5", "#A8E6CF", "#FFD23F", "#FF6B6B"),
    values = scales::rescale(c(0, 25, 75, 100), to = c(0, 1)),
    name = "Exposure Level\n(Thousands USD)"
  ) +
  labs(
    title = "Insurance Claims Heatmap",
    subtitle = "Total exposure by age and policy type | Darker = Higher risk",
    x = "Insurance Type", y = "Age Group"
  ) +
  theme_bw(base_size = 13) +
  theme(
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "white"),
    panel.grid = element_blank(),
    plot.title = element_text(size = 18, face = "bold", color = "#1A252F"),
    plot.subtitle = element_text(size = 12, color = "#5F6F7A"),
    axis.text = element_text(size = 12, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12, face = "bold"),
    axis.title = element_text(face = "bold", size = 13),
    legend.position = "right",
    legend.key.height = unit(1.5, "cm")
  )

ggsave(paste0(base_path, "/output/visuals/claim_amount_heatmap.png"),
       plot = p_amount_heatmap, width = 11, height = 7.5, dpi = 300, bg = "white")


# =============================================================================
# END OF SCRIPT
# =============================================================================