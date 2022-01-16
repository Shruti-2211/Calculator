library(shiny)

# Define UI for application that draws a histogram
user.interface <- fluidPage(
    
    # Application title
    titlePanel("Basic calculator"),
    h1("Shruti Goel"),
    
    # Sidebar 
    sidebarLayout(
        sidebarPanel(
             numericInput("first", "Digit 1:", 0),
             numericInput("second", "Digit 2:", 0),
             selectInput("operations", "Select Operation", 
                         choices = c("Addition", "Subtraction", "Multiplication", "Division", "Exponential Power"))
            ),
        
        mainPanel(
            h2("Result:"),
            textOutput("output")
        )
    )
)
     
# Define server logic 
backend.server <- function(input, output){
        output$output <- renderText({
            switch(input$operations,
                   "Addition" = input$first + input$second,
                   "Subtraction" = input$first - input$second,
                   "Multiplication" = input$first * input$second,
                   "Division" = input$first / input$second,
                   "Exponential Power" = input$first ** input$second)
                
        })
    }

# Run the application
shinyApp(ui = user.interface, server = backend.server)