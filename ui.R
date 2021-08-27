library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
dashboardPage(
    dashboardHeader(title = "Laboratorio 2"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("problema 1 L1", tabName = "problema_11"),
            menuItem("Problema 2 L1", tabName = "problema_21"),
            menuItem("problema 1 L2", tabName = "problema_12"),
            menuItem("Problema 2 L2", tabName = "problema_22")
        )
    ),
    dashboardBody(
        tabItems(
            tabItem("problema_11",
                    h1("Laboratorio 1 - Problema 1"),
                    box(textInput("ecuacion", "Ingrese la Ecuación"),
                    textInput("initVal", "X0"),
                    textInput("error", "Error"),
                    textInput("metodo", "Ingrese el metodo: 0,1 o 2")),
                    actionButton("nwtSolver", "Newton Solver"),
                    tableOutput("salidaTabla")),
            
            
            tabItem("Derivacion",
                    h1("Diferencias Finitas"),
                    box(textInput("difFinEcu", "Ingrese la Ecuación"),
                    textInput("valorX", "x"),
                    textInput("valorH", "h")),
                    actionButton("diferFinEval", "Evaluar Derivada"),
                    textOutput("difFinitOut")),
            
            tabItem("problema_21",
                    h1("Laboratorio 1 - Problema 2"),
                    box(textInput("ecuacion2", "Ingrese la Ecuación"),
                        textInput("initValx2", "X0"),
                        textInput("initValy2", "Y0"),
                        textInput("Error2", "Error"),
                        textInput("Metodo2", "Ingrese el metodo: 0,1 o 2")),
                    actionButton("nwtSolver2", "Newton Solver"),
                    tableOutput("salidaTabla2")),
            
            tabItem("problema_12",
                    h1("Laboratorio 2 - Problema 1 Biseccion"),
                    box(textInput("ecuacion21", "Ingrese la Ecuación"),
                        textInput("initVala", "a"),
                        textInput("initValb", "b"),
                        textInput("error21", "Error"),
                        textInput("kMax", "kMax")),
                    actionButton("biseccion", "biseccion"),
                    tableOutput("salidaTabla3")),
            
            tabItem("problema_22",
                    h1("Laboratorio 2 - Problema 2 Newton Solver"),
                    box(textInput("ecuacion22", "Ingrese la Ecuación"),
                        textInput("initValx0", "x0"),
                        textInput("Error22", "Error"),
                        textInput("kMax", "kMax")),
                    actionButton("nwtsolver22", "nwtsolver"),
                    tableOutput("salidaTabla4"))
        )
    )
)
