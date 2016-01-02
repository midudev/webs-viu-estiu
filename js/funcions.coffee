missatges = {
  tumtum : 'Data: dissabte 22 de juny<br />Hora: 18:30 h,<br />Lloc: pl. Sant Jordi'
  cervesa : 'Data: divendres 28 de juny<br />Hora: 19 h<br />Lloc: parc Nou'
  artistes : 'Data: divendres 28 de juny<br />Hora: 20 h<br />Lloc: centre d’Art Torre Muntadas'
  poesia : 'els dimarts de juliol a les 21 h, 2 i 9 als jardins de Torre Muntadas i 16 i 23 a pl. porxada del Cèntric Espai Cultural'
  preview : 'Data: dijous 4, 11, 18 i 25 de juliol<br />Hora: 21:30 h<br />Lloc: pl. porxada del Cèntric Espai Cultural'
  circ : 'Data: divendres 5 de juliol<br />Hora: 19:30 h<br />Lloc: pl. Sant Jordi'
  nitdansa : 'Data: divendres 12 de juliol<br />Hora: 22 h<br />Lloc: jardins de la Pau'
  covafoc : 'Data: dissabte 13 de juliol<br />Hora: 22 h<br />Lloc: parc del  Fondo d’en Peixo'
  melodia : 'Data: dissabte 20 de juliol<br />Hora: 19 h<br />Lloc: parc del Fondo d’en Peixo'
  pop : 'Data: divendres 26 de juliol<br />Hora: 19 h<br />Lloc: jardins de Torre Muntadas'
  }
  
tmpl = new t("<img src='/img/titol/{{=img}}' /><p>{{=missatge}}</p>");

$ ->

  $logo = $( document.getElementById 'logo' )
  $viulestiu = $( document.getElementById 'imatge_viulestiu' )
  $spots = $( '.spot' )
  $blur = $( document.getElementById 'blur' )
  $popup = $( document.getElementById 'popup' )
  
  $logo.transit( { y : -120 }, 800, 'ease' )
  $viulestiu.transit( { y : 20, opacity : 1 }, 1000, 'ease-in-out' )
  
  $spots
    .mouseenter( -> $( this ).find( 'img' ).transit( { opacity : 1 }, 300, 'ease-in-out' ) )
    .mouseleave( -> $( this ).find( 'img' ).transit( { opacity : 0 }, 300, 'ease-in-out' ) )

  $spots.click ( e ) ->
    e.preventDefault()
    rel = e.currentTarget.rel
    renderHTML = tmpl.render( { img: "#{rel}.png", missatge : missatges[ rel ] } )
    console.log renderHTML
    $popup.html( renderHTML )
    $blur.css( 'display', 'block' ).transit( { opacity : 0.8 }, 500, 'ease' )
    $popup.css( 'display', 'block' ).transit( { opacity : 1 }, 500, 'ease' )
    
  $blur.click ( e ) ->
    e.preventDefault()
    $blur.transit( { opacity : 0 }, 500, 'ease', -> $blur.css 'display', 'none' )
    $popup.transit( { opacity : 0 }, 500, 'ease', -> $popup.css 'display', 'none' )