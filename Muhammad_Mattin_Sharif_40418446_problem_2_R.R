#Problem 2: AI Chip
#install the packages
#install.packages("ompr")
#install.packages("ompr.roi")
#install.packages("ROI.plugin.glpk")
#install.packages("dplyr")
#library(ompr)
#library(ompr.roi)
#library(ROI.plugin.glpk)
#library(dplyr)

# Define the profits per chip for each customer and fab
profits_fab_a <- c(500, 300, 300, 200)
profits_fab_b <- c(100, 300, 350, 300)

# Define the capacities for each fab
capacity_fab_a <- 50
capacity_fab_b <- 42

# Define the maximum demand for each customer
demands <- c(36, 46, 11, 35)

# Define the model
model <- MIPModel() %>%

# Add variables for the number of chips to sell to each customer from each fab
add_variable(x[i, j], i = 1:4, j = c("A", "B"), type = "integer", lb = 0) %>%
  
# Objective function: Maximize total profit
set_objective(sum_expr(profits_fab_a[i] * x[i, "A"] + profits_fab_b[i] * x[i, "B"], i = 1:4), "max") %>%
  
# Demand constraints for each customer
add_constraint(x[1, "A"] + x[1, "B"] <= demands[1]) %>%
add_constraint(x[2, "A"] + x[2, "B"] <= demands[2]) %>%
add_constraint(x[3, "A"] + x[3, "B"] <= demands[3]) %>%
add_constraint(x[4, "A"] + x[4, "B"] <= demands[4]) %>%
  
# Capacity constraints for each fab
add_constraint(sum_expr(x[i, "A"], i = 1:4) <= capacity_fab_a) %>%
add_constraint(sum_expr(x[i, "B"], i = 1:4) <= capacity_fab_b)


# Solve the model
solution <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

solution

# Get the solution
get_solution(result, x[i, j])%>%
  filter(value > 0)


