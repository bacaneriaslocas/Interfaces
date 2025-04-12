import javax.sound.sampled.*;

class CampoTexto {
    float x;
    float y;
    float ancho;
    float alto;
    String etiqueta = "";
    String texto = "";
    boolean seleccionado = false;
    
    boolean clic;
    boolean block = false;
    boolean escritura = false;
    char keyPrevious = ' ';
    int i = 0;
    
    CampoTexto(float tempX, float tempY, float tempAncho, float tempAlto) {
        x = tempX;
        y = tempY;
        ancho = tempAncho;
        alto = tempAlto;
    }
    
    void mostrar() {
        fill(255);
        stroke(100);
        rect(x, y, ancho, alto);
        
        if (clic()) {
            seleccionado = true;
        }
        if (mousePressed == true && mouseSobre() == false) {
            seleccionado = false;
        }
        
        fill(0);
        textSize(alto * 0.7);
        
        String textoAmostrar = etiqueta;
        
        if (seleccionado) {
            if (keyPressed == false && escritura == false) {
                escritura = true;
            }
            
            if (key != keyPrevious) {
                escritura = true;
            }
            
            if (key != BACKSPACE || keyPressed == false) {
                i = 0;
            }
            
            if (key == keyPrevious && key == BACKSPACE) {
                i = i + 1;
                if (i > 40) {
                    escritura = true;
                }
            }
            
            if (escritura && keyPressed) {
                if (key == BACKSPACE) {
                    if (texto.length() > 0) {
                        texto = texto.substring(0, texto.length() - 1);
                    }
                } else{
                    if (Character.isLetter(key) || Character.isDigit(key) || key == ' ') {
                        texto = texto + key;
                    }
                }
                escritura = false;
            }
            textoAmostrar = texto;
            while(textWidth(textoAmostrar) > ancho * 0.92) {
                textoAmostrar = textoAmostrar.substring(1);
            }
            text(textoAmostrar + "|",x + ancho * 0.03,y + alto * 0.8);
            keyPrevious = key;
            
        } else {
            textoAmostrar = texto;
            while(textWidth(textoAmostrar) > ancho * 0.92) {
                textoAmostrar = textoAmostrar.substring(1);
            }
            text(textoAmostrar,x + ancho * 0.03,y + alto * 0.8);
        }
    }

    String texto() {
        return texto;
    }
    
    boolean mouseSobre() {  // verificamos si el raton esta encima del boton
        return mouseX > x &&  mouseX < x + ancho && mouseY > y && mouseY < y + alto;
    }
    
    boolean pulsado() { // verificamos si hemos clicado en el boton
        if (mouseSobre() && mousePressed) {
            return true;
        } else {
            return false;
        }
    }
    boolean clic() {  // verificamos si se ha producido un clic para no enviar constantemente la señal de pulsado
        if (pulsado() && clic == false && block == false) {
            clic = true;
            //playTone(700, 70);
            return true;
        } else {
            if (mousePressed == false) {
                clic = false;
            }
            return false;
        }
    }
    
}

class Dato {
    float x;
    float y;
    float variable;
    String COM;
    String texto;
    float tamaño;
    float espaciado;
    
    Dato(float tempX, float tempY, String tempTexto, float tempTamaño, float tempEspaciado) {
        x = tempX;
        y = tempY;
        texto = tempTexto;
        tamaño = tempTamaño;
        espaciado = tempEspaciado;
    }
    void mostrar(float tempVariable) {
        variable = tempVariable;
        fill(0);
        textSize(tamaño);
        text(texto, x, y);
        fill(#5BCB45);
        text(variable, x + textWidth(texto) + espaciado, y, tamaño);
    }
    void mostrarTexto(String tempVariable) {
        COM = tempVariable;
        fill(0);
        textSize(tamaño);
        text(texto, x, y);
        fill(#5BCB45);
        text(COM, x + textWidth(texto) + espaciado, y, tamaño);
    }
}
class Boton {
    float x, y;     // Posición del botón
    float ancho, alto;  // Tamaño del botón
    String etiqueta;// Texto dentro del botón
    float tamaño;   // tamaño del texto
    
    boolean clic;
    boolean block = false;
    
    color colorNormal = #939393;
    color colorSobre = #B2B2B2;
    color colorPulsado = #90A986;
    color colorBloqueado = #E6E6E6;
    color colorTexto = #000000;
    
    //Constructor para inicializar el botón
    Boton(float tempX, float tempY, float tempAncho, float tempAlto, String tempEtiqueta, float tempTamaño) {
        x = tempX - tempAncho / 2;
        y = tempY - tempAlto / 2;
        ancho = tempAncho;
        alto = tempAlto;
        
        etiqueta = tempEtiqueta;
        tamaño = tempTamaño;
    }
    
    boolean mouseSobre() {  // verificamos si el raton esta encima del boton
        return mouseX > x &&  mouseX < x + ancho && mouseY > y && mouseY < y + alto;
    }
    
    boolean pulsado() { // verificamos si hemos clicado en el boton
        if (mouseSobre() && mousePressed) {
            return true;
        } else {
            return false;
        }
    }
    boolean clic() {  // verificamos si se ha producido un clic para no enviar constantemente la señal de pulsado
        if (pulsado() && clic == false && block == false) {
            clic = true;
            playTone(700, 70);
            return true;
        } else {
            if (mousePressed == false) {
                clic = false;
            }
            return false;
        }
    }
    
    void colores(color tempBase, color tempTexto) {
        colorTexto = tempTexto;
        colorNormal = tempBase;
    }
    
    void block(boolean tempBlock) {
        block = tempBlock;
    }
    
    void mostrar() {      // recarga constante del boton en sus tres colores
        strokeWeight(2);
        stroke(#9B9B9B);
        if (mouseSobre() && !pulsado()) {    // Cambiar el color cuando el ratón está sobre el botón
            fill(colorSobre);
        } else {
            if (mouseSobre() && pulsado()) {      // Dibujar el botón basado en su estado normal o pulsado
                fill(colorPulsado);
            } else {
                fill(colorNormal);
            }
        }
        if (block == true) {
            fill(colorBloqueado);
        }
        
        rectMode(CORNER);
        rect(x, y, ancho, alto);
        
        // Mostrar el texto en el centro del botón
        fill(colorTexto);
        textSize(tamaño);
        textAlign(CENTER, CENTER);
        text(etiqueta, x, y, ancho, alto);
    }
}
void playTone(float frequency, int duration) {
    try {
        AudioFormat af = new AudioFormat(44100, 8, 1, true, false);
        SourceDataLine sdl = AudioSystem.getSourceDataLine(af);
        sdl.open(af);
        sdl.start();
        for (int i = 0; i < duration * 44.1; i++) {
            double angle = i / (44100 / frequency) * 2.0 * Math.PI;
            byte value = (byte)(Math.sin(angle) * 127.0);
            sdl.write(new byte[]{value} , 0, 1);
        }
        sdl.drain();
        sdl.stop();
    }
    catch(Exception e) {
        e.printStackTrace();
    }
}