# server.R

shinyServer(
   function(input, output) {   
      output$Plot <- renderPlot({
         # set seed is for reproducibility
         set.seed(1)

            trials <- NULL
            # Theoretical value of mean and variance of Binomial distribution
               mu <- input$Number * input$Probability
               sigma <- sqrt(input$Number * input$Probability * (1- input$Probability) )
         
         
            # For each histogram, we perform 1000 trials.
            for (i in 1:1000){
                  samples <- rbinom(n = input$Sample_size, 
                                    size = input$Number, 
                                    prob = input$Probability)
                  trials <- cbind(trials, (mean(samples) - mu)/(sigma/sqrt(input$Sample_size)))
            }
            
         hist(trials, freq = FALSE, main = "Histogram of (X1+...+Xm - mu)/(sigma/sqrt(m))")
         # Draw a standard normal distribustion curve 
         partition <- seq(from = -3, to = 3, by = 0.01) 
         lines(partition,dnorm(partition),col = "red", lwd = 2)
      
      })
      
   }
)
