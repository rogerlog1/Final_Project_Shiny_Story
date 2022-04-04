##More Testing
library(shiny)

ui <- fluidPage(
  titlePanel("My Interactive Story"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("Name", "What is your first name?", value = "", width = NULL, placeholder = NULL),
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
      sliderInput("Cats","Pick a number between 1 and 100", 50, min=1, max=100),
      textInput("NameFriend", "What is your best friend's name?", value = "", width = NULL, placeholder = NULL),
      textInput("Gang", "A funny noun?", value = "", width = NULL, placeholder = NULL),
     
    ),
    
    mainPanel(
      textOutput("Intro"),
      br(),
      textOutput("selected_var"),
      br(),
      textOutput("Cats"),
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
  
  output$Intro <- renderText({paste("On an uneventful Saturday,", input$Name, "wakes up to the sound of rustling 
                                    leaves on a nearbye tree outside. Today is a beautiful day. The sun is shining, the 
                                    birds are singing... 'What a perfect day to go to", input$var3,"for a while' you think to yourself. 
                                    You reach your hands above your head, streatching as sunlight poors into the room.
                                    You recall; however, that before you can go to", input$var3,"you need to go to 
                                    the grocery store.")})
  output$selected_var <- renderText({paste("With one final stretch, you bring yourself out of bed and make your way to the bathroom.
                                           You take a glance at yourself in the mirror, noting your", input$var, "hair and"
                                           , input$var2, "eyes. Yup! You're still you! You quickly go through your morning routine
                                           before heading out for the day.")})
  output$Cats <- renderText({ paste("Brenda has",input$Cats,"cats.")})
  output$namefriend <- renderText({ paste("You see your best friend",input$NameFriend,"running towards you with a concerned look.")})
  output$onyaway <- renderText({paste("Anyway, that's weird")})
  output$conflict <- renderText({paste("As you are walking down the sidewalk, you spot a group of guys approaching. 
                                       They look like trouble. One locks eyes with you for a little too long before
                                       walking up to you and saying:")})
  output$gang <- renderText({ paste("\"Don't mess with us, we're the",input$Gang,"Bunch. We rule these streets, capiche? 
                                    So why don't you mind your own business.\" 
                                    Quite rude of them considering you were already minding your own business.")})
  output$Buddy <- renderText({paste("\"Hey, that's my buddy, leave my buddy alone,\" ", "your friend says as they approach.")})
}

shinyApp(ui, server)