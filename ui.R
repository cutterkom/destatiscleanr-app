ui <-
  fluidPage(
    useShinyjs(),
    title = "Destatis Cleaner",
    theme = shinytheme("paper"),
    column(
      5,
      offset = 3,
      titlePanel("Destatis Cleaner"),
      
      tags$p(
        "The csv files of Destatis, the Federal Statistical Office of Germany, don’t comply with common standards of machine-readable datasets. This tools helps to jump start the data analysis by doing the time-consuming cleaning tasks. ",
        a(href = "https://github.com/cutterkom/destatiscleanr", "More information on Github.")
      ),
      tags$hr(),
      tags$p(
        "Start by uploading your file from the",
        a(href = "https://www-genesis.destatis.de/genesis/online", "Destatis' Genesis database"),
        ":"
      ),
      
      # Upload ------------------------------------------------------------------
      
      tags$h5("Upload & convert your data"),
      fileInput(
        "file1",
        "Choose a file:",
        multiple = FALSE,
        accept = c("text/csv",
                   "text/comma-separated-values,text/plain",
                   ".csv")
      ),
      tags$hr(),
      
      # Preview -----------------------------------------------------------------
      
      actionButton("button_table", "Preview table"),
      hidden(div(
        id = 'preview_table',
        DT::dataTableOutput("preview_table")
      )),
      
      
      # Structure  -----------------------------------------------------------------
      actionButton("button_str", "View data structure"),
      hidden(div(
        id = 'preview_str',
        verbatimTextOutput("preview_str")
        
      )),
      
      tags$hr(),
      # Download  -----------------------------------------------------------------
      downloadButton("downloadData", "Download"),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$hr(),
    tags$p("Built by", a(href="http://katharinabrunner.de", "Katharina Brunner"), ". See also the", a(href="https://github.com/cutterkom/destatiscleanr", "R package destatiscleanr"), ".")
  )
  )