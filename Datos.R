# Cargar los paquetes
library(dplyr)
library(lubridate)
library(ymd)
#--------------------------

set.seed(777)

# Aux function
sample_date <- function(start, end, n) {
  as.Date(runif(n, as.numeric(start), as.numeric(end)), origin = "1970-01-01")
}



# En Windows (cambia la ruta según tu usuario):
setwd("C:/Users/Michell/Downloads/Seguros")

dir.create("Seguros", showWarnings = FALSE)
setwd("Seguros")




# =========================================
# CLIENTS (100 registros)
# =========================================

n_clients <- 100

clients <- data.frame(
  id_client = 1:n_clients,
  gender = sample(c("male", "female", "other"), n_clients, replace = TRUE),
  age_group = sample(c("20-30", "31-40", "41-50", "51-60", "61-70", "71-80"), n_clients, replace = TRUE),
  income_level = sample(c("low", "medium", "high"), n_clients, replace = TRUE),
  occupations = sample(
    c("professional", "technical", "worker", "retired", "unemployed", "other"),
    n_clients, replace = TRUE
  ),
  stringsAsFactors = FALSE
)

write.csv(clients, "clients.csv", row.names = FALSE)


# =========================================
# POLICIES (100 registros)
# =========================================

n_policies <- 100

policies_types <- c("auto", "life", "health", "home")

policies <- data.frame(
  id_policy = 1:n_policies,
  type_insurance = sample(policies_types, n_policies, replace = TRUE),
  modality = sample(c("monthly", "annual", "quarterly"), n_policies, replace = TRUE),
  id_client = sample(clients$id_client, n_policies, replace = TRUE),
  issue_date = sample_date(ymd("2023-01-01"), ymd("2025-12-31"), n_policies),
  stringsAsFactors = FALSE
)

# Calcular start_date y end_date después de crear policies
policies$start_date <- pmax(policies$issue_date + 1, ymd("2023-01-01"))
policies$end_date <- policies$start_date + sample(c(365, 730, 1095, 1825), n_policies, replace = TRUE)

policies$policy_status <- sample(
  c("active", "canceled", "expired", "suspended", "renewed"),
  n_policies, replace = TRUE,
  prob = c(0.6, 0.1, 0.1, 0.1, 0.1)
)

policies$premium_monthly <- round(runif(n_policies, 20, 200), 2)
policies$premium_annual <- round(policies$premium_monthly * 12, 2)
policies$insured_amount <- round(runif(n_policies, 5000, 100000), 2)
policies$deductible <- round(runif(n_policies, 100, 5000), 2)

write.csv(policies, "policies.csv", row.names = FALSE)


# =========================================
# CLAIMS (100 registros, 2024 y 2025)
# =========================================

n_claims <- 100

claims_types <- c("accident", "theft", "fire", "liability", "other")

# 1. Asegurarse de que policies existe y tiene filas
if (!exists("policies") || nrow(policies) == 0) {
  stop("No existe o está vacío 'policies'. Revisa el bloque de POLICIES.")
}

sampled_policies <- policies[sample(1:nrow(policies), n_claims, replace = TRUE), ]

# 2. Generar fechas
claim_date_vec <- sample_date(ymd("2024-01-01"), ymd("2025-12-31"), n_claims)
notification_date_vec <- pmax(claim_date_vec, claim_date_vec + sample(0:10, n_claims, replace = TRUE))
closure_date_vec <- notification_date_vec + sample(1:60, n_claims, replace = TRUE)

# 3. Generar claimed_amount como vector (no como columna suelta)
claimed_amount_vec <- round(
  runif(n_claims, 500, pmin(sampled_policies$insured_amount, 50000)),
  2
)

# 4. Crear claims sin usar claimed_amount como objeto global
claims <- data.frame(
  id_claim = 1:n_claims,
  id_client = sampled_policies$id_client,
  id_policy = sampled_policies$id_policy,
  claim_date = claim_date_vec,
  notification_date = notification_date_vec,
  closure_date = closure_date_vec,
  claim_type = sample(claims_types, n_claims, replace = TRUE),
  severity = factor(sample(c("low", "medium", "high"), n_claims, replace = TRUE),
                    levels = c("low", "medium", "high")),
  claimed_amount = claimed_amount_vec,
  approved_amount = 0,
  paid_amount = 0,
  claim_status = sample(
    c("registered", "in_process", "closed", "rejected", "under_investigation"),
    n_claims, replace = TRUE,
    prob = c(0.1, 0.2, 0.5, 0.1, 0.1)
  ),
  stringsAsFactors = FALSE
)

# 5. Calcular approved_amount y paid_amount DESPUÉS, usando el data.frame
claims$approved_amount <- pmin(
  claims$claimed_amount,
  sampled_policies$insured_amount * 0.9
)

claims$paid_amount <- pmax(
  0,
  claims$approved_amount - as.numeric(sampled_policies$deductible * runif(n_claims, 0.5, 1.0))
)

claims$resolution_days <- as.numeric(difftime(claims$closure_date, claims$claim_date, units = "days"))

# 6. Reordenar columnas
claims <- claims[c(
  "id_claim", "id_client", "id_policy", "claim_date", "notification_date", "closure_date",
  "claim_type", "severity", "claimed_amount", "approved_amount", "paid_amount",
  "claim_status", "resolution_days"
)]

# 7. Guardar
write.csv(claims, "claims.csv", row.names = FALSE)



# =========================================
# PAYMENTS (100 registros, 2024 y 2025)
# =========================================

n_payments <- 100

methods <- c("debit", "card", "bank_transfer", "cash")

payments <- policies[sample(1:nrow(policies), n_payments, replace = TRUE), ]

payments <- data.frame(
  id_payment = 1:n_payments,
  id_policy = payments$id_policy,
  payment_date = sample_date(ymd("2024-01-01"), ymd("2025-12-31"), n_payments),
  payment_amount = round(payments$premium_monthly * runif(n_payments, 0.8, 1.2), 2),
  payment_method = sample(methods, n_payments, replace = TRUE),
  payment_status = sample(
    c("paid", "pending", "overdue", "rejected"),
    n_payments, replace = TRUE,
    prob = c(0.7, 0.1, 0.15, 0.05)
  ),
  stringsAsFactors = FALSE
)

payments$days_overdue <- ifelse(
  payments$payment_status == "overdue",
  as.numeric(ymd("2025-12-31") - payments$payment_date),
  0
)
payments$days_overdue <- pmax(0, payments$days_overdue)

# Reordenar columnas
payments <- payments[c(
  "id_payment", "id_policy", "payment_date", "payment_amount",
  "payment_method", "payment_status", "days_overdue"
)]

write.csv(payments, "payments.csv", row.names = FALSE)







