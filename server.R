library(shiny)
library(reticulate)

source_python("algoritmos_lab2.py")

#tableOut, soluc = newtonSolverX(-5, "2x^5 - 3", 0.0001)

shinyServer(function(input, output) {
    
    #Evento y evaluación de metodo de newton para ceros
    newtonCalculate<-eventReactive(input$nwtSolver, {
        inputEcStr<-input$ecuacion[1]
        print(inputEcStr)
        initVal<-input$initVal[1]
        print(initVal)
        error<-input$error[1]
        print(error)
        metodo<-input$metodo[1]
        #outs<-add(initVal, error)
        outs<-newtonSolverX(initVal, inputEcStr, error,metodo)
        print(error)
        outs
    })
    
    newtonCalculate2<-eventReactive(input$nwtSolver2, {
        inputEcStr2<-input$ecuacion2[1]
        print(inputEcStr2)
        initValx2<-input$initValx2[1]
        initValy2<-input$initValy2[1]
        error2<-input$Error2[1]
        metodo2<-input$Metodo2[1]
        #outs<-add(initVal, error)
        outs<-newtonSolverXY(initValx2,initValy2, inputEcStr2, error2,metodo2)
        outs
    })
    
    #Evento y evaluación de diferencias finitas
  #  diferFinitCalculate<-eventReactive(input$diferFinEval, {
  #      inputEcStr<-input$difFinEcu[1]
  #      valX<-input$valorX[1]
  #      h<-input$valorH[1]
  #      outs<-evaluate_derivate_fx(inputEcStr, valX, h)
  #      as.character(outs)
  #  })

    
    # Lab 1 - Problema1
    diferFinitCalculate<-eventReactive(input$diferFinEval, {
        x0<-input$initVal[1]
        f_x<-input$ecuacion[1]
        eps<-input$Error[1]
        func<-input$Metodo[1]
        outs<-newtonSolverX(x0, f_x, eps,func)
        as.character(outs)
    })
    
    
    biseccionCalculate<-eventReactive(input$biseccion, {
      inputEcStr<-input$ecuacion21[1]
      print(inputEcStr)
      error<-input$error21[1]
      print(error)
      a<-input$initVala[1]
      print(a)
      b<-input$initValb[1]
      print(b)
      kmax<-input$kMax[1]
      print(kmax)
      #outs<-add(initVal, error)
      outs<-biseccion(inputEcStr, error,a,b,kmax)
      outs
    })
    
    
    nwtSolver22Calculate<-eventReactive(input$nwtsolver22, {
      inputEcStr<-input$ecuacion22[1]
      initValx0 <- input$initValx0[1]
      print(initValx0)
      print(inputEcStr)
      error<-input$Error22[1]
      print(error)
      kmax<-input$kMax[1]
      print(kmax)
      #outs<-add(initVal, error)
      outs<-newtonSolverX(initValx0,inputEcStr, error,kmax)
      outs
    })
    
    
    #REnder metodo de Newton
    output$salidaTabla<-renderTable({
        newtonCalculate()
    })
    
    output$salidaTabla2<-renderTable({
        newtonCalculate2()
    })
    
    #Render Diferncias Finitas
    output$difFinitOut<-renderText({
        diferFinitCalculate()
    })
    
    #Render tablas biseccion
    output$salidaTabla3<-renderTable({
      biseccionCalculate()
    })
    
    
    output$salidaTabla4<-renderTable({
      nwtSolver22Calculate()
    })
    
    
})
