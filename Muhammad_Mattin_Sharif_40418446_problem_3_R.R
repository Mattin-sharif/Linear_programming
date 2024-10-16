#Problem 2: Make-to-Stock Chemotherapy Drugs
#install the packages
#install.packages("ompr")
#install.packages("ompr.roi")
#install.packages("ROI.plugin.glpk")
#install.packages("dplyr")
#library(ompr)
#library(ompr.roi)
#library(ROI.plugin.glpk)
#library(dplyr

#Define the constants for the problem
sales_prices <- c(1200, 1400)  # Prices for Chemo1 and Chemo2
costs <- c("EU" = 800, "US" = 1500)  # Costs for EU and US constituents
max_demand <- c(200000, 40000)  # Maximum demand for Chemo1 and Chemo2
min_delivery <- c(100000, 10000)# Minimum delivery for Chemo1 and Chemo2
inventory <- c("EU" = 80000, "US" = 120000)   # Inventory for EU and US constituents
D_metrics <- c("EU" = 25, "US" = 15)          # D-metrics for EU and US constituents
P_metrics <- c("EU" = 87, "US" = 98)          # P-metrics for EU and US constituents
min_P_metrics <- c(88, 93)      # Minimum P-metrics for Chemo1 and Chemo2
regions <- c("EU", "US")

#Initialize the model
model <- MIPModel() %>%
  
#Add decision variables for the number of vials
add_variable(x[chemo, region], chemo = 1:2, region = regions, type = "integer", lb = 0) %>%
  
#Set the objective function to maximize profit
set_objective(sum_expr((sales_prices[chemo] - costs[region]) * x[chemo, region], chemo = 1:2,
                       region = regions), sense = "max") %>%
  
#Add constraints for the D-metric and P-metric for each drug
add_constraint(D_metrics["EU"] * x[1, "EU"] + D_metrics["US"] * x[1, "US"] <= 23 * 
                 sum_expr(x[1, region], region = regions)) %>%
add_constraint(D_metrics["EU"] * x[2, "EU"] + D_metrics["US"] * x[2, "US"] <= 23 *
                 sum_expr(x[2, region], region = regions)) %>%
add_constraint(P_metrics["EU"] * x[1, "EU"] + P_metrics["US"] * x[1, "US"] >= min_P_metrics[1] *
                 sum_expr(x[1, region], region = regions)) %>%
add_constraint(P_metrics["EU"] * x[2, "EU"] + P_metrics["US"] * x[2, "US"] >= min_P_metrics[2] *
                 sum_expr(x[2, region], region = regions)) %>%
#Add constraints for the maximum demand and minimum delivery
add_constraint(sum_expr(x[1, region], region = regions) <= max_demand[1]) %>%
add_constraint(sum_expr(x[1, region], region = regions) >= min_delivery[1]) %>%
add_constraint(sum_expr(x[2, region], region = regions) <= max_demand[2]) %>%
add_constraint(sum_expr(x[2, region], region = regions) >= min_delivery[2]) %>%
  
#Add inventory constraints
add_constraint(sum_expr(x[chemo, "EU"], chemo = 1:2) <= inventory["EU"]) %>%
add_constraint(sum_expr(x[chemo, "US"], chemo = 1:2) <= inventory["US"])

#Solve the model using the GLPK solver
solution <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

solution

#Get the solution
get_solution(solution, x[chemo, region]) %>%
  filter(value > 0)
