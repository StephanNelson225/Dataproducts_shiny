rates <- read.csv("data/rates.csv", header=TRUE)# This is the data file.

shinyServer(function(input, output) {
  output$text1 <- renderText({ 
    paste("You are a case manager directing the services of a person with disabilities who is entitled to services within
          a budgeted amount.You have selected", input$var, ". The hourly rate is $", rates[rates$service==input$var,3]," per hour.",
          "It is one of four services that you as a case manager can choose. 
          The available services are: Behaviorial Programming, Independent Living Skills, Supported Work and Custodial Care. 
          Please heed the budget warning so that the budget will not be exceeded"  )
            
  })  

  output$text2 <-renderText({
      paste("You have selected", input$var, ". The hourly rate is $", rates[rates$service==input$var,3],
    " per hour.","You have chosen", input$integer,"hours of service.","Your total cost is $",
    input$integer*rates[rates$service==input$var,3], " and there is $", 24000-input$integer*rates[rates$service==input$var,3], " left in your budget")})
    
  output$overbudget <- renderUI({
      if (input$integer*rates[rates$service==input$var,3]> 24000){
       span(strong("Warning, The budget has been exceeded.  Please change the service and/or reduce the planned hours."), style = "color:red;", align="right")
      }
   
  })
   
  output$CostPlot <- renderPlot({
    
  par(mfrow=c(1,2))
  barplot(input$integer*rates[rates$service==input$var,3],width=220, xlim=c(0,300), 
          ylim=c(-20,28000), main=("Budget Impact of \nCare Management Choice"),adj=0)
  segments(x=60, y=24000, x1=260, y1=24000, col="red") 
  text(135,25000, label="Maximum Budget")
  text(160,2000, label=input$var)
  text(0,26500, label="Spending",xpd = TRUE, pos=3)
  plot(rates[rates$service==input$var,3]*seq(1:2400),ylim=c(-20,27000), xlim=c(0,2500), main=("Total Cost of Care \nin Relation to Service Hours"),xlab=("Hours of Service"),bty="n",  ylab=NA, cex.axis=.9)
  segments(x=600, y=24000, x1=2400, y1=24000, col="red")
  text(1300,25000, label="Maximum Budget")
  text(1600,8000, label=input$var)
  })
})
