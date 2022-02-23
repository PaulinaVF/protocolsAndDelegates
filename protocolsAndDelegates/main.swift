//El protocolo AdvancedLifeSupport dice que quien desee cumplirlo debe poder hacer CPR
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? //el handler dice que debe haber un delegate que cumpla los requerimientos del protocolo AdvancedLifeSupport
    
    func asessSituation () {
        print("Can you tell me what happened?")
    }
    
    //Así, si el método es actuvado el delegate debería poder vubrir la acción solicitada por el protocolo (CPR)
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        //Al iniciar, nuestro objeto se da de alta con el handler para convertirse en el delegate.
        handler.delegate = self
    }
    
    //Cumple el requerimiento implementando la función performCPR
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        //Al iniciar, nuestro objeto se da de alta con el handler para convertirse en el delegate.
        handler.delegate = self
    }
    
    //Cumple el requerimiento implementando la función performCPR
    func performCPR() {
        print("The doctor does chest compressions, 30 per second")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Also sings when saving the person")
    }
}


//Tenemos un handler:
    let johana = EmergencyCallHandler()


//Tenemos un delegado del handler... cualquiera de los tres cumpliría con el protocolo que se requiere:
    let peter = Paramedic(handler: johana)
    //let hanna = Doctor(handler: johana)
    //let amy = Doctor(handler: johana)

//El handler realiza las acciones sin importar cual de los anteriores o si fuera otro el delegado, con la única condición de que el delegado cumpla el protocolo
johana.asessSituation()
johana.medicalEmergency()

