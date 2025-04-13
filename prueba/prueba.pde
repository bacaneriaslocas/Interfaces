PImage logo;
PFont fuente;

CampoTexto usuario;
CampoTexto contraseña;
Grafica grafica1;

String usuarioTexto = "Bacaneriaslocas";
String contraseñaTexto = "Tarsila01";  

int ventana = 1;

float[] variableX = {100, 14.25, 89.34, 23.45, 67.89, 34.56, 78.12, 90.01, 56.78, 12.34, 98.76, 45.67, 23.89, 67.45, 34.12, 78.56, 90.34, 56.12, 12.78, 98.45};

void setup() {
    fuente = createFont("RobotoMono-Regular.ttf",20);
    textFont(fuente);
    logo = loadImage("logo.png");
    usuario = new CampoTexto(width / 2 - width * 0.25, height * 0.5, width * 0.5, height * 0.05);
    contraseña = new CampoTexto(width / 2 - width * 0.25, height * 0.6, width * 0.5, height * 0.05);

    grafica1 = new Grafica(width / 2 - width * 0.25, height * 0.5, width * 0.5, height * 0.5);

    size(800,800);
    background(255);
}

void draw() {
    if (ventana == 0) {
        background(255);
        imageMode(CENTER);
        fill(100);
        text("Usuario", width * 0.25, height * 0.49);
        text("Contraseña", width * 0.25, height * 0.59);
        image(logo, width / 2, height * 0.2,width * 0.5,height * 0.45);
        usuario.mostrar();
        contraseña.mostrar();
        
        if (key == ENTER) {
            if (usuario.texto.equals(usuarioTexto) && contraseña.texto.equals(contraseñaTexto)) {
                ventana = 1;
                surface.setResizable(true);
                surface.setSize(displayWidth, displayHeight);
            } else {
                println("Usuario o contraseña incorrectos");
                key = 0;
                
            }
        }
    }  
    if (ventana == 1) {
        background(0);
        
        fill(255);
        textSize(50);
        
        grafica1.mostrarX(variableX);
    }
    
}