PImage logo;
PFont fuente;

CampoTexto usuario;
CampoTexto contraseña;

String usuarioTexto = "Bacaneriaslocas";
String contraseñaTexto = "Tarsila01";  

int ventana = 0;

void setup() {
    fuente = createFont("RobotoMono-Regular.ttf",20);
    textFont(fuente);
    logo = loadImage("logo.png");
    usuario = new CampoTexto(width / 2 - width * 0.25, height * 0.5, width * 0.5, height * 0.05);
    contraseña = new CampoTexto(width / 2 - width * 0.25, height * 0.6, width * 0.5, height * 0.05);
    
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
                print("klk");
            }
        }
    }  
}