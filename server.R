server <- function(input, output) { 

### INTRODUCTION ##### 
  #### PLOT 1 #####
  output$plot <- renderPlotly({
    p <- gapminder %>%
      plot_ly(
        x = ~introdata$Genre, 
        y = ~introdata$Unique.Words, 
        color = ~introdata$Genre,
        frame = ~introdata$Year, 
        size = 15,
        type = 'scatter',
        mode = 'markers'
      ) %>%
      layout(xaxis = x, yaxis = y, showlegend = TRUE)
  })
  
  x <- list(
    title = "Genre"
  )
  
  y <- list(
    title = "# Unique Words")

  #### PLOT 2 #####
  output$plot2 <- renderPlotly({
    p <- plot_ly(
      x = chord2$child_path,
      y = chord2$probability,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Probability'), xaxis = list(title = 'Chord'), 
             title = 'Sample Probability For Chord Length of 2',
             size = 9)
  })
  
### METHOD ####
  
  #### PLOT 2 #####
  output$plot2.5 <- renderPlotly({
    p <- plot_ly(
      x = chord2$child_path,
      y = chord2$probability,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Probability'), xaxis = list(title = 'Chord'), 
             title = 'Sample Probability For Chord Length of 2',
             size = 9)
  })  
  
  #### PLOT 3 ####
  output$plot3 <- renderPlotly({
    p <- plot_ly(
      x = chord3$child_path,
      y = chord3$probability,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Probability'), xaxis = list(title = 'Chord'), 
             title = 'Sample Probability For Chord Length of 3',
             size = 9)
  })
  
  #### PLOT 4 ####
  output$plot4 <- renderPlotly({
    p <- plot_ly(
      x = chord4$child_path,
      y = chord4$probability,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Probability'), xaxis = list(title = 'Chord'), 
             title = 'Sample Probability For Chord Length of 4',
             size = 9)
  })
  
  #### PLOT 5 ####
  output$plot5 <- renderPlotly({
    p <- plot_ly(
      x = chordtosong$Chord,
      y = chordtosong$Count.Songs,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Sum of Songs'), xaxis = list(title = 'Chord Progression'), 
             title = 'Sum of Songs Corresponding to Chord Progression',
             size = 9)
  })
### DATA ####
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(chord2)
  })
  
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(chord3)
  })
  
  output$mytable3 <- DT::renderDataTable({
    DT::datatable(chord4)
  })
  
  output$mytable4 <- renderDataTable({
    DT::datatable(finaldata, options = list(scrollX = TRUE))
  })
  
  output$mytable5 <- renderDataTable({
    DT::datatable(artistdf, options = list(scrollX = TRUE))
  })
  
  output$mytable6 <- renderDataTable({
    DT::datatable(finaldata2, options = list(scrollX = TRUE))
  })

### RESULTS #####
  
  }