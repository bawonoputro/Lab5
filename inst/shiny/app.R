# app.R
library(shiny)
library(Lab5)  # your package with get_municipalities(), get_kpi(), get_ou()

ui <- fluidPage(
  titlePanel("Kolada Explorer"),
  sidebarLayout(
    sidebarPanel(
      textInput("kpi_search", "Search KPIs (title/description):", placeholder = "e.g., employment | jobb | syssels"),
      textInput("ou_search", "Filter OUs by text:", placeholder = "e.g., stockholm"),
      actionButton("refresh", "Refresh data")
    ),
    mainPanel(
      h4("Municipalities (peek)"),
      tableOutput("tbl_mun"),
      h4("KPIs (filtered)"),
      tableOutput("tbl_kpi"),
      h4("Organisational Units (filtered)"),
      tableOutput("tbl_ou")
    )
  )
)

server <- function(input, output, session) {

  # Load once, allow manual refresh
  data_all <- reactive({
    input$refresh  # dependency
    isolate({
      mun <- get_municipalities()
      kpi <- get_kpi()
      ou  <- get_ou()
      list(mun = mun, kpi = kpi, ou = ou)
    })
  })

  output$tbl_mun <- renderTable({
    head(data_all()$mun, 6)
  })

  # KPI filter
  kpi_filtered <- reactive({
    kpi <- data_all()$kpi
    keep <- intersect(names(kpi), c("id","title","owner","description","type"))
    if (!nzchar(input$kpi_search)) return(head(kpi[keep], 10))
    pat <- tolower(input$kpi_search)
    idx <- grepl(pat, tolower(paste(kpi$title, kpi$description)))
    head(kpi[idx, keep, drop = FALSE], 20)
  })

  output$tbl_kpi <- renderTable(kpi_filtered())

  # OU filter
  ou_filtered <- reactive({
    ou <- data_all()$ou
    if (!nzchar(input$ou_search)) return(head(ou, 10))
    pat <- tolower(input$ou_search)
    idx <- grepl(pat, tolower(paste(ou$title, ou$id, ou$municipality)))
    head(ou[idx, , drop = FALSE], 20)
  })

  output$tbl_ou <- renderTable(ou_filtered())
}

shinyApp(ui, server)
