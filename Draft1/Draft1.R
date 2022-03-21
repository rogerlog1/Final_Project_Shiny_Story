##More Testing
library(shiny)

ui <- fluidPage(
  titlePanel("Character Creator"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("var",
                  label = "What color is your hair?",
                  choices = c("blonde",
                              "black",
                              "brown",
                              "red"),
                  selected = "brown"),
      selectInput("var2",
                  label = "What color are your eyes?",
                  choices = c("blue",
                              "green",
                              "brown",
                              "hazel"),
                  selected = "blue"),
      selectInput("var3",
                  label = "Is your character old?",
                  choices = c("young",
                              "old"),
                  selected = "young"),
      selectInput("var4",
                  label = "Gender",
                  choices = c("man",
                              "woman"),
                  selected = "man"),
    ),
    
    mainPanel(
      textOutput("selected_var"),
      br(),
      p("Setting setting setting."),
      textOutput("selected_var2"),
    )
  )
)
server <- function(input, output) {
  
  output$selected_var <- renderText({
    paste("Your character has", input$var, "hair and", input$var2, "eyes.")
  })
  output$selected_var2 <- renderText({ 
    paste("Your character is a(n)", input$var3, input$var4, "on their way to a local park.")
  })
  
}

shinyApp(ui, server)