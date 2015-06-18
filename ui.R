# ui.R

shinyUI(fluidPage(
   titlePanel("Demonstration of Central Limit Theorem (Binomial Distribution)"),
   
   sidebarLayout(
      sidebarPanel(
         helpText("Central Limit Theorem (CLT) tells us that the distribution of the sample means has 
                  an approximate normal distribution, no matter what the distribution of the original 
                  data looks like, as long as the sample size is large enough."),
         helpText("With this app, you can see how CLT work on Bimonial Distribution."),
         helpText("Given sample size n and probability p, a trial means sample n value from the 
                  binomial distribution and then centralize these value."),
         helpText("For each histogram, we perform 1000 trials."),
         
         br(),
         
         sidebarPanel(
            sliderInput("Number",
                        "Number of Binomial Distribution (n):",
                        min = 1,
                        max = 30,
                        value = 15),
            
            sliderInput("Probability",
                     "Probability of Binomial Distribution (p):",
                     min = 0.01,
                     max = 0.99,
                     value = 0.1),
            
            sliderInput("Sample_size",
                     "Sample size for each trial (m):",
                     min = 1,
                     max = 50,
                     value = 1)
         )
         
      ),
      
      mainPanel(
         plotOutput("Plot")
      )
   )
))