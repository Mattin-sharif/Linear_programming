# Linear Programming using R

## Problem-1: Customized Automotive Tech

### Decision Variables

Let 𝑥𝑖𝑗 be a binary variable that equals 1 if product j is produced in plant i, and 0 otherwise.
𝑥𝑖𝑗={1,if product 𝑗 is produced in plant 𝑖0, otherwise

### Objective Function

The goal is to maximize the total number of batches manufactured, which is given by the sum of the products of each plant's capacity and the decision variables. 

maximize 𝑍=Σ Σ 𝐶𝑖𝑗∗𝑥𝑖𝑗 4𝑗=15𝑖=1

Where 𝐶𝑖𝑗is the capacity of the plant i for the product j, and double summation is over all plants i and all products j.
Plugging in the provided capacity values into the objective function, we get: 

![image](https://github.com/user-attachments/assets/788e965f-a16d-4114-9b3a-2c4f34c0ffb1)

Maximize 𝑍 = 1200𝑥1,1+1400𝑥2,1+600𝑥3,1+800𝑥4,1+800𝑥5,1+1200𝑥2,2+1400𝑥5,2+600𝑥1,3+800𝑥2,3+200𝑥3,3+1000𝑥5,3+1000𝑥1,4+1000𝑥2,4+600𝑥3,4+1200𝑥4,4+1600𝑥5,4

**Constraints**

Each product must be produced in only one plant.
(For product 1) : 𝑥1,1+𝑥2,1+𝑥3,1+𝑥4,1+𝑥5,1=1
(For product 2) : 𝑥2,2 +𝑥5,2=1
(For product 3) : 𝑥1,3+𝑥2,3+𝑥3,3 +𝑥5,3=1
(For product 4) : 𝑥1,4+𝑥2,4+𝑥3,4+𝑥4,4+𝑥5,4=1

Each plant can be scheduled for the production of at most one of the products.
(For plant 1) : 𝑥1,1+𝑥1,2+𝑥1,3+𝑥1,4≤1
(For plant 2) : 𝑥2,1+𝑥2,2+𝑥2,3+𝑥2,4≤1
(For plant 3) : 𝑥3,1+𝑥3,2+𝑥3,3+𝑥3,4≤1
(For plant 4) : 𝑥4,1+𝑥4,2+𝑥4,3+𝑥4,4≤1

Plants 1, 3, and 4 cannot manufacture product 2, and plant 4 cannot manufacture product 3. 𝑥1,2=𝑥3,2=𝑥4,2=𝑥4,3=0
The decision variables are binary.
𝑥𝑖𝑗∈ {0,1} for all i and j.

### Explanation

 The objective function corresponds to the total number of batches produced across all plants and products, as per the given capacity table.
 The constraints for each product ensure that each product is only made in one plant.
 The constraints for each plant ensure that each plant only makes at most one product.
 The specific constraints for plant-product combinations that are not allowed are set to 0, which represents these restrictions.
 The binary nature of the decision variables corresponds to the yes/no decision of whether a product is made in a certain plant.

This model is designed to maximize production while adhering to the limitations of plant capacities and production possibilities. The result of this model will tell us the optimal allocation of products to plants for maximum batch production.

### R code

![image](https://github.com/user-attachments/assets/c4c28afa-32a6-476e-8a9c-b83710da5d73)
![image](https://github.com/user-attachments/assets/91438006-ac43-4009-b7f4-3799d2e1450c)

### Results
![image](https://github.com/user-attachments/assets/e3c1b059-b846-4773-9de2-40f2bbd1cbdc)

### Managerial Results

The production manager can schedule the plants in such a way that the total production across all plants and products will be 4600 batches in one production period.
 Product 1 should be produced in Plant 1
 Product 2 should be produced in Plant 2
 Product 3 should be produced in Plant 5
 Product 4 should be produced in Plant 4


## Problem-2: AI Chip

### Decision Variables:

Let 𝑥𝑖𝑗 represent the number of million chips sold to customer i from factory j. Here, i ranges over the set {1, 2, 3, 4} corresponding to the four customers, and j is in {A, B} for the two factories.
 𝑥1𝐴: Sold to customer 1 from factory A
 𝑥2𝐴: Sold to customer 2 from factory A
 𝑥3𝐴: Sold to customer 3 from factory A
 𝑥4𝐴: Sold to customer 4 from factory A
 𝑥1𝐵: Sold to customer 1 from factory B
 𝑥2𝐵: Sold to customer 2 from factory B
 𝑥3𝐵: Sold to customer 3 from factory B
 𝑥4𝐵: Sold to customer 4 from factory B

### Objective Function:

Our objective is to maximize the total profit (Z), which is calculated as the sum of individual profits from selling chips to each customer from each factory. The profit from each sale is the difference between the offered price and the sum of the production and delivery costs, all multiplied by the number of chips sold. 

maximize 𝑧=Σ Σ (𝑃𝑖−𝐶𝑗−𝐷𝑖𝑗)∗ 𝑥𝑖𝑗 𝐵𝑗=𝐴4𝑖=1

Where 𝑃𝑖 is the price offered by customer i, 𝐶𝑗 is the production cost at factory j, and 𝐷𝑖𝑗 is the delivery cost from factory j to customer i.
Plugging in the provided values into the objective function, we get: 

𝑀𝑎𝑥𝑖𝑚𝑖𝑧𝑒 𝑍=(1950−1150−300)𝑥1𝐴+(1950−1250−600)𝑥1𝐵+(1850−1150−400)𝑥2𝐴+⋯+(1800−1250−250) 𝑥4𝐵


![image](https://github.com/user-attachments/assets/c0043bc8-09b4-4aab-994b-83d77709db98)

### Constraints:

**Demand Constraints**:
Each customer's demand cannot be exceeded.
(For customer 1) : 𝑥1𝐴+𝑥1𝐵 ≤36
(For customer 2) : 𝑥2𝐴+𝑥2𝐵≤46
(For customer 3) : 𝑥3𝐴+𝑥3𝐵≤11
(For customer 4) : 𝑥4𝐴+𝑥4𝐵≤35

**Capacity Constraints**: Each factory's capacity cannot be exceeded.
(For factory A) : 𝑥1𝐴+𝑥2𝐴+𝑥3𝐴+𝑥4𝐴 ≤50
(For factory A) : 𝑥1𝐵+𝑥2𝐵+𝑥3𝐵+𝑥4𝐵 ≤42

**Non-Negativity Constraints:** The number of chips sold must be non-negative.
𝑥𝑖𝑗>0 for all i and j

By solving this linear programming problem, we will be able to find out how many chips Teranikx should agree to sell to each customer to maximize total profit, as well as calculate what that maximum profit is.
The model includes the specific unit profit for each customer-factory combination after considering the respective production and delivery costs. The demand constraints ensure that sales do not exceed the customer's maximum demand, and the capacity constraints ensure that the factories do not produce more than their capacity. Solving this linear programming model will provide the optimal number of chips TeraNix should sell to each customer and the maximum total profit that can be achieved.


## R code:
![image](https://github.com/user-attachments/assets/67a3f8ba-38dd-4286-a0f1-111f3ead8b26)
![image](https://github.com/user-attachments/assets/60c8cd46-5ec0-4ff7-acfb-f91c37406176)

## results:
![image](https://github.com/user-attachments/assets/cfe87c7e-7626-4293-9528-1b8523b52451)

## Managerial Results:

The maximum total profit that Teranikx can achieve is 35350 Million ₰.
The optimal distribution of chip sales to each customer from each factory is as follows:
 Sell 36 million chips to Customer 1 from Factory A
 Sell 14 million chips to Customer 2 from Factory A
 Sell 31 million chips to Customer 2 from Factory B
 Sell 11 million chips to Customer 3 from Factory B



## Problem-3: Make-to-Stock Chemotherapy Drugs

### Decision Variables:

Let's define the decision variables for the number of vials of EU and US constituents used in Chemo1 and Chemo2:
 𝑥1𝐸𝑈: Number of vials of EU constituent used in Chemo1
 𝑥1𝑈𝑆: Number of vials of US constituent used in Chemo1
 𝑥2𝐸𝑈: Number of vials of EU constituent used in Chemo2
 𝑥2𝑈𝑆: Number of vials of US constituent used in Chemo2
These variables are non-negative integers since we can't use a negative amount of constituents and we deal with whole vials.

### Objective Function:

We want to maximize the monthly profit, which is the revenue from selling the chemotherapy compounds minus the cost of the constituents used.
𝑀𝑎𝑥𝑖𝑚𝑖𝑧𝑒 𝑍=Σ 2𝑖=1Σ(𝑆𝑃𝑖−𝐶𝑗)∗𝑥𝑖𝑗 𝑈𝑆𝑗=𝐸𝑈
Where 𝑆𝑃𝑖 is the selling price of chemo in i, while 𝐶𝑗 is the cost to manufacture in region j.
Simplifying the profit function: 𝑀𝑎𝑥𝑖𝑚𝑖𝑧𝑒 𝑍=(1200𝑥1𝐸𝑈+1200𝑥1𝑈𝑆+1400𝑥2𝐸𝑈+1400𝑥2𝑈𝑆)−(800𝑥1𝐸𝑈+1500𝑥1𝑈𝑆+800𝑥2𝐸𝑈+1500𝑥2𝑈𝑆)

### Constraints:

**D-metric and P-metric for Chemo1 and Chemo2:** 
87𝑥1𝐸𝑈+98𝑥1𝑈𝑆 ≤88 (𝑥1𝐸𝑈+𝑥1𝑈𝑆) P-metric Constraints for Chemo1 with a minimum P-metric of 88
87𝑥1𝐸𝑈+98𝑥1𝑈𝑆 ≤93 (𝑥2𝐸𝑈+𝑥2𝑈𝑆) P-metric Constraints for Chemo2 with a minimum P-metric of 93
25𝑥1𝐸𝑈+15𝑥1𝑈𝑆 ≤23 (𝑥1𝐸𝑈+𝑥1𝑈𝑆) D-metric Constraints for Chemo1 considering they must not exceed 23
25𝑥2𝐸𝑈+15𝑥2𝑈𝑆 ≤23 (𝑥2𝐸𝑈+𝑥2𝑈𝑆) D-metric Constraints for Chemo2 considering they must not exceed 23

**Demand and Delivery Constraints:**
𝑥1𝐸𝑈+𝑥1𝑈𝑆 ≤200,000 For Chemo-1
𝑥1𝐸𝑈+𝑥1𝑈𝑆 ≥100,000 For Chemo-1
𝑥2𝐸𝑈+𝑥2𝑈𝑆 ≤40,000 For Chemo-2
𝑥2𝐸𝑈+𝑥2𝑈𝑆 ≥10,000 For Chemo-2

**Inventory Constraints**:
𝑥1𝐸𝑈+𝑥2𝐸𝑈 ≤80,000 For EU constituents
𝑥1𝑈𝑆+𝑥2𝑈𝑆 ≤120,000 For US constituents

**Non-Negativity Constraints:**
𝑥1𝐸𝑈,𝑥2𝐸𝑈,𝑥1𝑈𝑆,𝑥2𝑈𝑆≥0

### Explanation:

 The objective function is derived from the profit per vial sold minus the cost per vial of the constituents.
 The D-metric and P-metric constraints ensure that the final product meets the quality standards.
 The demand constraints ensure that production does not exceed the maximum demand and that at least the minimum delivery amount is met.
 The inventory constraints ensure that the usage of constituents does not exceed the available inventory.
 The non-negativity constraints ensure that we do not have negative quantities, which is not physically possible.

Calculation of D-metrics and P-metrics:
After solving the problem, calculate the D-metrics and P-metrics for Chemo1 and Chemo2 using the optimal values of 𝑥1𝐸𝑈,𝑥2𝐸𝑈,𝑥1𝑈𝑆,𝑥2𝑈𝑆.
For Chemo1: 𝐷𝐶ℎ𝑒𝑚𝑜1=𝑥1𝐸𝑈∗25+𝑥1𝑈𝑆∗15𝑥1𝐸𝑈+𝑥1𝑈𝑆 𝑃𝐶ℎ𝑒𝑚𝑜1=𝑥1𝐸𝑈∗87+𝑥1𝑈𝑆∗98𝑥1𝐸𝑈+𝑥1𝑈𝑆
For Chemo2: 𝐷𝐶ℎ𝑒𝑚𝑜2=𝑥2𝐸𝑈∗25+𝑥2𝑈𝑆∗15𝑥2𝐸𝑈+𝑥2𝑈𝑆 𝑃𝐶ℎ𝑒𝑚𝑜2=𝑥2𝐸𝑈∗87+𝑥2𝑈𝑆∗98𝑥2𝐸𝑈+𝑥2𝑈𝑆
This model aims to maximize monthly profit by blending the right amount of EU and US constituents to produce Chemo1 and Chemo2 while meeting all the specified metrics and constraints. After solving, the model will provide the optimal number of vials to produce, the maximum profit, and the D-metrics and P-metrics for each type of chemotherapy drug.


### R code:
![image](https://github.com/user-attachments/assets/36ccaa8d-1a8e-4363-b8b5-233ea6622b6f)
![image](https://github.com/user-attachments/assets/fc664dde-d705-49a6-8089-915e6bb22281)

### Results:
![image](https://github.com/user-attachments/assets/37c0dbf3-1a83-4e48-b829-ec7798f46094)

**Computing the D-metrics and P-metrics:**

For Chemo1: 𝐷𝐶ℎ𝑒𝑚𝑜1=𝑥1𝐸𝑈∗25+𝑥1𝑈𝑆∗15𝑥1𝐸𝑈+𝑥1𝑈𝑆= (75455∗25) + (24545∗15)75455+24545= 22.5455
𝑃𝐶ℎ𝑒𝑚𝑜1=𝑥1𝐸𝑈∗87+𝑥1𝑈𝑆∗98𝑥1𝐸𝑈+𝑥1𝑈𝑆= (75455∗87)+(24545∗98)75455+24545=89.6999
For Chemo2: 𝐷𝐶ℎ𝑒𝑚𝑜2=𝑥2𝐸𝑈∗25+𝑥2𝑈𝑆∗15𝑥2𝐸𝑈+𝑥2𝑈𝑆=(4545∗25)+(5455∗15)4545+5455=19.545
𝑃𝐶ℎ𝑒𝑚𝑜2=𝑥2𝐸𝑈∗87+𝑥2𝑈𝑆∗98𝑥2𝐸𝑈+𝑥2𝑈𝑆=(4545∗87)+(5455∗98)4545+5455=93.0005

### Managerial Results:

Quantities of constituents blended into Chemo1 and Chemo2:
The quantities of the EU and US constituents to blend into Chemo1 and Chemo2 for maximum monthly profit are:
 Chemo1: 75,455 vials of EU constituents and 24,545 vials of US constituents.
 Chemo2: 4,545 vials of EU constituents and 5,455 vials of US constituents.

**Maximum Monthly Profit:**

The maximum monthly profit given by the objective value in the solution output is €25,000,000.
D-metrics of Chemo1 and Chemo2:
The D-metrics for Chemo1 and Chemo2, which represent the weighted average based on the proportion of EU and US constituents in each drug, are:
 Chemo1: D-metric = 22.545
 Chemo2: D-metric = 19.545
P-metrics of Chemo1 and Chemo2:
The P-metrics for Chemo1 and Chemo2, which also represent the weighted average based on the proportion of EU and US constituents, are:
 Chemo1: P-metric = 89.699
 Chemo2: P-metric = 93.000


