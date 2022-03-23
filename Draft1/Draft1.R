##More Testing
library(shiny)

ui <- fluidPage(
  titlePanel("My Interactive Story"),
  
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
                  label = "What is your gender?",
                  choices = c("man",
                              "woman"),
                  selected = "man"),
      numericInput("Age","How old are you?", 20, min=1, max=120),
      textInput("Name", "What is your name?", value = "", width = NULL, placeholder = NULL),
      textInput("Gang", "A funny noun?", value = "", width = NULL, placeholder = NULL),
     
    ),
    
    mainPanel(
      textOutput("Intro"),
      br(),
      textOutput("selected_var"),
      br(),
      textOutput("selected_var2"),
      br(),
      textOutput("age"),
      br(),
      textOutput("name"),
      br(),
      textOutput("conflict"),
      br(),
      textOutput("gang")
    )
  )
)
server <- function(input, output) {
  
  output$Intro <- renderText({paste("Today is a beautiful day. The sun is shining, the birds are singing, the tank is clean...")})
  output$selected_var <- renderText({paste("Your character has", input$var, "hair and", input$var2, "eyes.")})
  output$selected_var2 <- renderText({ paste("Your character is a(n)", input$var3, input$var4, "on their way to a local park.")})
  output$age <- renderText({ paste("You are",input$Age,"years old.") })
  output$name <- renderText({ paste("Your name is",input$Name) })
  output$conflict <- renderText({paste("As you are walking down the sidewalk, you spot a group of guys approaching. They look like no good. One walks up to you and says:")})
  output$gang <- renderText({ paste("\"Don't mess with us, we're the",input$Gang,"Bunch. We rule these streets, capiche?\" ") })
  
}

shinyApp(ui, server)