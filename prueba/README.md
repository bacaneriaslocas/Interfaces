# Project Documentation

## Overview
This project is designed to create a graphical interface using Processing. It includes custom libraries and functions for managing buttons and other graphical elements.

## Project Structure
```
prueba
├── libraries
│   └── [custom-library-folder]
├── functions
│   └── buttons.pde
├── prueba.pde
└── README.md
```

## File Descriptions

- **libraries/[custom-library-folder]**: 
  This folder is intended to store custom libraries that you create for your graphical interface. You can place any library files here that define reusable components or functions.

- **functions/buttons.pde**: 
  This file contains functions related to button creation and management. You can define functions to create buttons, handle button clicks, and manage their appearance.

- **prueba.pde**: 
  This is the main file for your graphical interface. It sets up the canvas and can import functions from the `functions/buttons.pde` file to utilize the button functionalities. To include the button functions, use the following directive at the beginning of your `prueba.pde` file:
  ```pde
  #include "functions/buttons.pde"
  ```

## Setup Instructions
1. Ensure you have Processing installed on your system.
2. Clone or download this project to your local machine.
3. Navigate to the `prueba` directory.
4. Open `prueba.pde` in Processing.
5. Modify the `buttons.pde` file to add your custom button functionalities as needed.
6. Run the `prueba.pde` file to see your graphical interface in action.

## Usage
- To create buttons, define them in `buttons.pde` and call those functions in `prueba.pde`.
- Customize the appearance and behavior of buttons by modifying the functions in `buttons.pde`.

## Contributing
Feel free to contribute by adding new features or improving existing functionalities. Make sure to document any changes you make.