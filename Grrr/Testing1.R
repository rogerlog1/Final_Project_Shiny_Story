if (interactive()) {
    
    ui <- fluidPage(
        numericInput("obs", "How old are you?", 10, min = 1, max = 100),
        textOutput("value")
    )
    server <- function(input, output) {
        output$value <- renderText({ paste("You are",input$obs,"years old.") })
    }
    shinyApp(ui, server)
}
