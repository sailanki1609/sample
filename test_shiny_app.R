# Load the Shiny package
library(shiny)

# Define UI (User Interface)
ui <- fluidPage(
  
  # App title
  titlePanel("Simple Shiny App"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Text box for entering a name
      textInput("name", "Enter your name:", value = "Your Name"),
      
      # Input: Slider for selecting a number range
      sliderInput("num", 
                  "Select a number:", 
                  min = 1, 
                  max = 100, 
                  value = 50)
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Display user's name
      textOutput("greeting"),
      
      # Output: Plot the selected number
      plotOutput("plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Text output: Greet the user
  output$greeting <- renderText({
    paste("Hello,", input$name, "!")
  })
  
  # Plot output: Plot a simple graph based on the selected number
  output$plot <- renderPlot({
    plot(1:input$num, (1:input$num)^2, type = "b", col = "blue",
         main = paste("Square of numbers from 1 to", input$num),
         xlab = "Number", ylab = "Square")
  })
}

# Run the app
shinyApp(ui = ui, server = server)
