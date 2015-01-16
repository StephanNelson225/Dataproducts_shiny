require(shiny)

shinyUI(fluidPage(
  titlePanel("CareManagement Budgeting"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Calculates the cumulative yearly cost of a
               selected service. Select the client service 
               from the list in the box. The slider determines 
               the number of yearly hours.  The total cost depends 
               on the rate per hour.  The first graph on the right
               shows how budget for the selected parameters relate
               to total cost.  The next graph assists in gauging
               the hour maximum for each service."),
               p("App Documentation:",a("CaseManagement",href="Documentation.html")),
               p("App Code:" ,a("Code",href="doc1.html")),
      
      selectInput("var", 
                  label = "Service to calculate",
                  choices = c("Behavioral Programming", "Independent Living Skills",
                              "Supported Work", "Custodial Care"),
                  selected = "Custodial Care"),
      
      sliderInput("integer", 
                  label = "Estimated Hours:",
                  min = 0, max = 2400, value= 1200)
    ),
    mainPanel(
      plotOutput("CostPlot"),  
      uiOutput("overbudget"),
      tabsetPanel(type = "tabs", 
                  tabPanel("About", textOutput("text1")),
                  tabPanel("Summary", textOutput("text2"))
                  
                
      )
      
  )
      
  )
))
