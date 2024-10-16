
#Problem 1: Customized Automotive Tech
#install the packages
install.packages("ompr")
install.packages("ompr.roi")
install.packages("ROI.plugin.glpk")
install.packages("dplyr")
library(ompr)
library(ompr.roi)
library(ROI.plugin.glpk)
library(dplyr)

#Define the model
model <- MIPModel() %>%
  
#Add decision variables
add_variable(x[i, j], i = 1:5, j = 1:4, type = "binary") %>%
  
#Add the objective function
  set_objective(1200*x[1,1] + 1400*x[2,1] + 600*x[3,1] + 800*x[4,1] + 800*x[5,1] +
                  1200*x[2,2] + 1400*x[5,2] +
                  600*x[1,3] + 800*x[2,3] + 200*x[3,3] + 1000*x[5,3] +
                  1000*x[1,4] + 1000*x[2,4] + 600*x[3,4] + 1200*x[4,4] +
                  1600*x[5,4], sense = "max") %>%
  
#Each product is produced in only one plant
add_constraint(sum_expr(x[i,1], i = 1:5) == 1) %>%
add_constraint(sum_expr(x[i,2], i = c(2,5)) == 1) %>%
add_constraint(sum_expr(x[i,3], i = c(1,2,3,5)) == 1) %>%
add_constraint(sum_expr(x[i,4], i = 1:5) == 1) %>%
  
#Each plant produces at most one product
add_constraint(sum_expr(x[1,j], j = 1:4) <= 1) %>%
add_constraint(sum_expr(x[2,j], j = 1:4) <= 1) %>%
add_constraint(sum_expr(x[3,j], j = 1:4) <= 1) %>%
add_constraint(sum_expr(x[4,j], j = 1:4) <= 1) %>%
add_constraint(sum_expr(x[5,j], j = 1:4) <= 1) %>%
  
#Plants cannot produce certain products
add_constraint(x[1,2] == 0) %>%
add_constraint(x[3,2] == 0) %>%
add_constraint(x[4,2] == 0) %>%
add_constraint(x[4,3] == 0)

#Solve the model
solution <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

#Print the solution
solution

#Get the solution
get_solution(solution, x[i,j]) %>%
  filter(value > 0)





