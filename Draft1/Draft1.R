##More Testing
library(shiny)

ui <- fluidPage(
  titlePanel("My Interactive Story"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("Name", "What is your name?", value = "", width = NULL, placeholder = NULL),
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
                  label = "Where would you like to go today?",
                  choices = c("the park",
                              "the hiking trails",
                              "the beach"),
                  selected = "the park"),
      sliderInput("Age","Pick a number between 1 and 100", 50, min=1, max=100),
      textInput("NameFriend", "What is your best friend's name?", value = "", width = NULL, placeholder = NULL),
      textInput("Gang", "A funny noun?", value = "", width = NULL, placeholder = NULL),
     
    ),
    
    mainPanel(
      textOutput("IntrototheIntro"),
      br(),
      textOutput("Intro"),
      br(),
      textOutput("selected_var"),
      br(),
      textOutput("age"),
      br(),
      textOutput("name"),
      br(),
      textOutput("onyaway"),
      br(),
      textOutput("conflict"),
      br(),
      textOutput("gang"),
      br(),
      textOutput("namefriend"),
      br(),
      textOutput("Buddy")
    )
  )
)
server <- function(input, output) {
  
  output$IntrototheIntro <- renderText({paste("")})
  output$Intro <- renderText({paste("Today is a beautiful day. The sun is shining, the birds are singing... 
                                    What a perfect day to go to", input$var3,"for a while.", input$Name,
                                    "reaches their hands above their head, streatching as sunlight poors 
                                    into the room, through an agape window beside the bed, and into",
                                    input$Name,"'s bed.")})
  output$selected_var <- renderText({paste("Your character has", input$var, "hair and", input$var2, "eyes.")})
  output$age <- renderText({ paste("Brenda has",input$Age,"kids.") })
  output$name <- renderText({ paste("Your name is",input$Name) })
  output$namefriend <- renderText({ paste("You see your best friend",input$NameFriend,"running towards you with a concerned look.") })
  output$onyaway <- renderText({paste("")})
  output$conflict <- renderText({paste("As you are walking down the sidewalk, you spot a group of guys approaching. 
                                       They look like trouble. One locks eyes with you for a little too long before
                                       walking up to you and saying:")})
  output$gang <- renderText({ paste("\"Don't mess with us, we're the",input$Gang,"Bunch. We rule these streets, capiche? 
                                    So why don't you mind your own business.\" 
                                    Quite rude of them considering you were already minding your own business.") })
  output$Buddy <- renderText({paste("\"Hey, that's my buddy, leave my buddy alone,\" ", "your friend says as they approach.")})
}

shinyApp(ui, server)