server <- function(input, output) {

  data <- function(){
    req(input$file1)
    df <- destatiscleanr::destatiscleanr(input$file1$datapath)
    return(df)
  }

  output$downloadData <- downloadHandler(
    
    filename = function() {
      paste0("converted_", input$file1$name)
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
  
  observeEvent(input$button_table, {
    
    toggle('preview_table')
    output$preview_table <- DT::renderDataTable(data())
    
  })
  
  observeEvent(input$button_str, {
    toggle('preview_str')
    output$preview_str <- renderPrint({str(data())})
  })
  
}