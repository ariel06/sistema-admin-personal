/**
 * Contiene todas las funciones comunes a todos los módulos.
 */
 
function Module( name ) {
	this.parameters = null ;
	this.validator = new Array() ;
	this.name = name ;
	this.debugLayer = null ;
	this.MAX_DEBUG_LINES = 50 ;
	this.currentDebugLines = 0 ;
	this.infoLayer = null ;
	this.usuId = null ;
}

Module.prototype.setUsuId = function( u ) {
	this.usuId = u ;
}

Module.prototype.setInfoLayer = function( l ) {
	this.infoLayer = document.getElementById( l )  ;
}

Module.prototype.showInfo = function( str ) {
	if ( this.infoLayer ) this.infoLayer.innerHTML = str ;
}

Module.prototype.showError = function( str ) {
	if ( this.infoLayer ) {
		this.infoLayer.innerHTML = '<blink><font color="red">' + str + '</font></blink>' ;
		alert( str ) ;
	}
	
}

Module.prototype.showError2 = function( str ) {
	if ( this.infoLayer ) {
		this.infoLayer.innerHTML = '<blink><font color="red">' + str + '</font></blink>' ;
	}
	
}

Module.prototype.debug = function( str ) {
	if ( this.debugLayer != null ) {
		if ( ++this.currentDebugLines > this.MAX_DEBUG_LINES ) {
			this.debugLayer.innerHTML = "" ;
			this.currentDebugLines = 0 ;
		}
		this.debugLayer.innerHTML += str + "<br>" ;
	}
}

Module.prototype.setDebugLayer = function( l ) {
	this.debugLayer = document.getElementById( l )  ;
}

Module.prototype.setParameters = function( p ) {
	this.parameters = p ;
}

Module.prototype.addValidator = function( v ) {
	this.validators[ this.validators.length ] = v ;
}

// Carga un objeto javascript.
Module.prototype.loadObject = function( ) {
	
}

// Invoca un metodo remoto con el formulario f.
Module.prototype.callFromForm = function( metodo, f ) {
	var obj = this.formToObject( f ) ;
	if ( this.usuId != null ) obj.USU_ID = this.usuId ;
	var url = "xmlrpc" ;
	var xmlrpc = importModule( "xmlrpc" ) ;
	var service = new xmlrpc.ServiceProxy( url, [ this.name + "." + metodo ] );
//	var str = "" ;
//	alert( service ) ;
//	for ( var i in service.InhumacionNichoUrnasBR.asignarDatosInhumacion ) {
//		str += i + " " ;
//	}
	
//	alert( str ) ;
	var ret = null ;
//	alert( obj.TME_NRO ) ;
	eval( "ret = service." + this.name + "." + metodo  + "( obj ) ;" ) ;
	return ret ;

}

Module.prototype.clear = function( layerName ) {
	var l = document.getElementById( layerName ) ;
	l.innerHTML = "";
}

// Carga un componente html.
Module.prototype.loadComponent = function( componentName, layerName, params ) {
	
	var parametros = "" ;
	if ( params ) {
		parametros += "?" ;
		for ( var i in params )	parametros += i + "=" + params[ i ] + "&" ;
	}
//	alert( parametros ) ;
	var l = document.getElementById( layerName ) ;
//	alert( l ) ;
	var req ;

	if ( window.XMLHttpRequest ) // if Mozilla, Safari etc
		req = new XMLHttpRequest( ) ;
	else if ( window.ActiveXObject ){ // if IE
		try {
			req = new ActiveXObject( "Msxml2.XMLHTTP" ) ;
		} catch ( e ) {
			try{
				req = new ActiveXObject( "Microsoft.XMLHTTP" ) ;
			} catch ( e ) { }
		}
	} else return false ;
	req.open( 'GET', "componentes/" + componentName + ".jsp" + parametros, false ) ;
	req.send( null ) ;
	l.innerHTML = req.responseText ;
	return true ;
}
// Convierte los datos de un formulario en objeto para poder enviarlo por rpc
/*
Module.prototype.formToObject = function( f ) {
	
	var obj = new Object() ;
	var e = f.elements ;
	for ( var i = 0 ; i < e.length ; i++ ) {
		var t = e[ i ].type ;
		if ( e[ i ].name ) {
			var name = e[ i ].name ;
			// this.debug( "formToObject: type: " + t ) ;
	//		select-one, radio, checkbox
			if ( t == "text" || t == "hidden" ) {
				obj[ name ] = e[ i ].value ;
			} else if ( t == "radio" ) {
				if ( e[ i ].checked ) obj[ name ] = e[ i ].value ;
			} else if ( t == "checkbox" ) {
				if ( e[ i ].checked ) obj[ name ] = e[ i ].value ;
			} else if ( t == "select-one" ) {
				obj[ name ] = e[ i ].options[ e[ i ].selectedIndex ].value ;
			}
			this.debug( name + ": " + obj[ name ] ) ;
		}
	}
	return obj ;
}
*/
Module.prototype.formToObject = function( f ) {
	
	var obj = new Object() ;
	var e = f.elements ;
	for ( var i = 0 ; i < e.length ; i++ ) {
		var t = e[ i ].type ;
		if ( e[ i ].name ) {
			var name = e[ i ].name ;
			// this.debug( "formToObject: type: " + t ) ;
	//		select-one, radio, checkbox
			if ( t == "text" || t == "hidden" ) {
				obj[ name ] = e[ i ].value ;
			} else if ( t == "radio" ) {
				if ( e[ i ].checked ) obj[ name ] = e[ i ].value ;
			} else if ( t == "checkbox" ) {
				if ( e[ i ].checked ) {
					if ( !obj[ name ] ) {
						obj[ name ] = e[ i ].value ;
					} else {
						//alert( typeof( obj[ name ] ) ) ;
						if ( typeof( obj[ name ] ) == "string" ) {
							var aux = new Array() ;
							aux[ 0 ] = obj[ name ] ;
							obj[ name ] = aux ;
						}
						obj[ name ][ obj[ name ].length++ ] = e[ i ].value ;
					}
				}
//				if ( e[ i ].checked ) obj[ name ] = e[ i ].value ;
			} else if ( t == "select-one" ) {
				obj[ name ] = e[ i ].options[ e[ i ].selectedIndex ].value ;
			}
			this.debug( name + ": " + obj[ name ] ) ;
		}
	}
	return obj ;
}

Module.prototype.objectToForm = function( f, obj ) {
	for ( var i in obj ) {
		var e =  f.elements[ i ] ;
		if ( e && e.type ) {
			switch ( e.type ) {
				case "text": 
						e.value = obj[ i ] ;
					break ;
			}
		}
	}
}
