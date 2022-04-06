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
      sliderInput("Cats","Pick a number between 2 and 100", 50, min=2, max=100),
      textInput("NameFriend", "What is your best friend's name?", value = "", width = NULL, placeholder = NULL),
      textInput("Gang", "A funny noun?", value = "", width = NULL, placeholder = NULL),
     
    ),
    
    mainPanel(
      textOutput("Intro"),
      br(),
      textOutput("bathroom"),
      br(),
      textOutput("Enter"),
      br(),
      textOutput("Cats1"),
      br(), 
      textOutput("Cats2"),
      br(),
      textOutput("onyaway"),
      br(),
      textOutput("conflict"),
      br(),
      textOutput("gang"),
      br(),
      textOutput("namefriend"),
      br(),
      textOutput("Buddy"),
      br(),
      textOutput("Ending"),
      br(),
      textOutput("TheEnding")
    )
  )
)
server <- function(input, output) {
  
  output$Intro <- renderText({paste("On an uneventful Saturday,", input$Name, "wakes up to the sound of rustling 
                                    leaves on a nearbye tree outside. Today is a beautiful day. The sun is shining, the 
                                    birds are singing... 'What a perfect day to go to", input$var3,"for a while' you think to 
                                    yourself. You reach your hands above your head, streatching as sunlight poors into the room.
                                    You recall; however, that before you can go to", input$var3,"you need to go to 
                                    the grocery store.")})
  output$bathroom <- renderText({paste("With one final stretch, you bring yourself out of bed and make your way to the bathroom.
                                           You take a glance at yourself in the mirror, noting your", input$var, "hair and"
                                           , input$var2, "eyes. Yup! You're still you! You quickly go through your morning routine
                                           before heading out for the day.")})
  output$Enter <- renderText({ paste("It isn't long before you arive at the store. As you enter, you catch a part
                                    of a conversation between two elderly women.")})
  output$Cats1 <- renderText({ paste("\"Did you hear? Brenda got another cat.\"")})
  output$Cats2 <- renderText({ paste("\"Well golly, how many is that now?", input$Cats, "cats?\"")})
  output$namefriend <- renderText({ paste("You see your best friend",input$NameFriend,"running towards you with a concerned look.")})
  output$onyaway <- renderText({paste("Well that's weird... Anyway, you have some groceries to buy.")})
  output$conflict <- renderText({paste("With all the groceries bought, you begin heading back home. 
                                       As you are walking down the sidewalk, you spot a group of guys approaching. 
                                       They look like trouble. One locks eyes with you for a little too long before
                                       walking up to you and saying:")})
  output$gang <- renderText({ paste("\"Don't mess with us, we're the",input$Gang,"Bunch. We rule these streets, capiche? 
                                    So why don't you mind your own business.\" 
                                    Quite rude of them considering you were already minding your own business.")})
  output$Buddy <- renderText({paste("\"Hey, that's my buddy, leave my buddy alone,\" ", "your friend says as they approach.
                                    The shadey group scoff and murmur before continuing on their way. \"Those guys were jerks.
                                    Are you okay?\" your friend asks. You let them know that you're okay and ask if they would
                                    like to go to", input$var3, "with you. \"Sure, I don't have anything going on,\" they reply.")})
  output$Ending <- renderText({ paste("And so the two of you go on to have a lovely day at", input$var3, "and the" ,input$Gang,
                                      "Bunch never messed with you again.")})
  output$TheEnding <- renderText({ paste("The End")})
}

shinyApp(ui, server)