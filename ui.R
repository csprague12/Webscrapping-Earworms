dashboardPage(
  
### HEADER ####
  dashboardHeader(title = "Striking The Right Chord",
                  titleWidth = 250),

### SIDEBAR ####
  dashboardSidebar(width = 250,
  sidebarMenu(
    menuItem("Introduction", tabName = "Introduction"),
    menuItem('Method', tabName = 'Method'),
    menuItem('Data', tabName = 'Data'),
    menuItem('Results', tabName = 'Results'),
    menuItem('References', tabName = 'References'),
    menuItem('Contact', tabName = 'Contact')
              )
  ),

### BODY ####
  dashboardBody(
    tabItems(
      
  ### INTRODUCTION ####     
      tabItem(tabName = 'Introduction',
              fluidPage(
                h3('Word Count in Song Lyrics Over Time'),
                
                h5('Donald Knuth, an acomplished computer scientist, wrote a paper in 
                   1977 on computational complexity theory and discussed the tendency
                   of popular songs to be mostly repetitive words with little meaning.
                   While his paper received comedic reactions, his paper has been sited by many 
                   researchers and potentially holds some truth.'),
                
                h5('The graph below is a visual respresentation of song lyrics, specifically
                   exploring an overview on lyric repetition by genre. If a song has a high 
                   amount of unique words, then repetition should have a low presence.'),
                
                plotlyOutput("plot"),
                
                h3('Chord Progression & Earworms'),
                
                h5('To start, a chord consists of at least two or more notes and a chord sequence consists
                   of two or more chords. Recently, there has been research about earworms which are a set of 
                   characteristics in similar songs and contribute to having a song stuck in your head. While
                   verbal earworms are uncommon, music earworms have become of interest to many music and psychology
                   researchers. One of the attractions to exploring chord progression and earworms is a potential
                   relationship with song success, defined as album/song sales and song popularity.'),
                
                h5('The bar graph below is a sample visualization of chord sequence probability. For example,
                   the probability of a chord V or 5 occuring after chord 4 and chord 1 is 44% or 0.44.'),
                
                plotlyOutput("plot2")
              )
              ),
  ### METHOD ####
  tabItem('Method',
    fluidPage(
      h3('Source Websites'),
      h5('For this project, the primary website used was HookTheory, which 
          contained data on chord progression probabilities for a sequence of 
           two, three, or four chords.'),
      h5('The second website scraped was the IFPI which stands for the International
          Federation of the Phonographic Industry. This website is similar to Billboard,
          but their music rankings are purely music sales, meaning clothing does not count.'),
    fluidRow(
      h3('Chord 2'),
                   
      h5('This is the base for the following two chord datasets because we select the
          chords based on the highest probabilities and feed them through the webscrapping
          code to output probabilities for longer chord lengths.'),
      plotlyOutput('plot2.5')
                 ),
                 
    fluidRow(
      h3('Chord 3'),
      h5('Using the top five highest chord probabilities in the first graph,
          we input those chords to retrieve the probabilities for an additional chord
          to each of the previous chord sequence.'),
      plotlyOutput('plot3')
                 ),
                 
    fluidRow(
      h3('Chord 4'),
                   
      h5('Using the top five highest chord probabilities in the second graph,
         we input those chords to retrieve the probabilities for an additional chord
         to each of the previous chord sequence.'),
      plotlyOutput('plot4')
                   ),
      
    fluidRow( 
    h3('Chord to Song'),
          
      h5('Using the top chord probabilities across chord progressions
          of two, three, and four, we now obtain songs containing each
          chord progression.')),
          
     fluidRow (
       plotlyOutput('plot5')
          ),
    
    fluidRow(
     h3('Gathering additional song metrics'),
          
     h5('Using the list of songs from HookTheory, we can obtain
        additional song metrics such as danceability, beats, and tempo.
        These additional metrics will serve as dummy variables for our regression.'))
        )   
         ),

  ### DATA ####
tabItem(tabName = 'Data',
      mainPanel(
        tabsetPanel(
          id = 'dataset',
          tabPanel("Chord2", DT::dataTableOutput("mytable1")),
          tabPanel("Chord3", DT::dataTableOutput("mytable2")),
          tabPanel("Chord4", DT::dataTableOutput("mytable3")),
          tabPanel("Songs", DT::dataTableOutput("mytable4", width = 550)),
          tabPanel("IFPI", DT::dataTableOutput("mytable5", width = 550)),
          tabPanel("Reg. Data", DT::dataTableOutput("mytable6", width = 550))
        )
      )
      ),

  ### RESULTS & DISCUSSION #####
tabItem(tabName = 'Results',
      fluidPage(  
        mainPanel(
          tabsetPanel(
            tabPanel('Stats Output', div(img(src="analysis.png"))),
            tabPanel('Residuals vs. Fitted',div(img(src="Rplot1.png"))),         
            tabPanel('Normal QQ', div(img(src="Rplot2.png"))),
            tabPanel('Scale Location', div(img(src="Rplot3.png"))),
            tabPanel('Residuals vs. Leverage', div(img(src="Rplot4.png")))
                              )
          ))
      ),

  ### REFERENCES #####
tabItem(tabName = 'References',
        fluidPage(
          HTML(
            paste(
              h3('Works Cited'), "<br>",
              h5('Interiano, Myra et al. "Musical Trends And Predictability 
                 Of Success In Contemporary Songs In And Out Of'), 
              h5('The Top Charts." Royal Society Open Science 5.5 (2018):'),
              h5('171274. Web. 29 Oct. 2018.'),"<br>",
              
              h5('Knuth, Donald E.. “The complexity of songs.” CACM (1984).'), "<br>",
              h5('Percino, Gamaliel, Peter Klimek, and Stefan Thurner.'), 
              h5('"Instrumentational Complexity Of Music Genres And Why Simplicity Sells."'), 
              h5('PLoS ONE 9.12 (2014): e115255. Web. 29 Oct. 2018.'), "<br>",
              
              h3('Websites Used'), "<br>",
              h5('HookTheory'),
              h5('IFPI'),
              h5('Wikipedia - List of Best-selling Singles')
            )
          )
        )),

  ### CONTACT ####
tabItem(tabName = 'Contact',
        fluidPage(HTML(
          paste(
            h4("Contact Information"),
            #Email
            "<b>", "Email:","</b>","<b>", 
            "<a href = 'mailto:celina.sprague2@gmail.com'>", 
            "celina.sprague2@gmail.com","</b>","</a>",
            #Phone
            "<br>", "<b>", "Phone:","</b>", "(202)236-4552",
            "<br>", "<b>", "LinkedIn:", "</b>","<b>", 
            "<a href = 'https://www.linkedin.com/in/celinasprague/'>", 
            "Click Here","</b>" ,"</a>"
            )
          )
          )
        )

    )
  )
    
  
  
) # End of dashboard page
