# dart_tic_tac_toe
A simple Tic-Tac-Toe (XO) game implemented in Dart.
# Tic-Tac-Toe Console Application in Dart

This is a simple console-based Tic-Tac-Toe (XO) game implemented using the Dart programming language. It allows two human players to take turns making their moves on a 3x3 grid. The game continues until one player wins or the board is full, resulting in a draw.

## How to Run the Game

To play this game, you need to have the Dart SDK (Software Development Kit) installed on your system. You can download and install it from the official Dart website: [https://dart.dev/get-dart](https://dart.dev/get-dart)

Once you have Dart installed, follow these steps to run the game:

1.  **Save the `main.dart` file:**
    Make sure you have saved the provided Dart code in a file named `main.dart`.

2.  **Open your terminal or command prompt:**
    Navigate to the directory where you saved the `main.dart` file.

3.  **Run the Dart application:**
    Execute the following command in your terminal:
    ```bash
    dart main.dart
    ```
    This command will compile and run the Dart code, and the game will start in your console.

## How to Play

1.  The game board is represented by numbers 1 through 9. Each number corresponds to a specific cell on the 3x3 grid as follows:

    ```
     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9
    ```

2.  Player 'X' goes first.
3.  When it's your turn, you will be prompted to "Choose Number for X" or "Choose Number for 0".
4.  Enter a number between 1 and 9 corresponding to the empty cell where you want to place your marker.
5.  The board will be updated after each move, and the game will check for a winner or a draw.
6.  The game ends when one player gets three of their markers in a row (horizontally, vertically, or diagonally), or when all nine cells are filled without a winner (a draw).
7.  After the game ends, you will be asked if you want to play again. Type `yes` to start a new game or `no` to quit.

## Features

* Simple and interactive console-based Tic-Tac-Toe game.
* Two-player mode (human vs. human).
* Input validation to ensure players choose numbers within the valid range (1-9) and empty cells.
* Clear display of the game board after each turn in the console.
* Automatic detection of winning conditions (three in a row, column, or diagonal).
* Detection of draw conditions when all cells are filled.
* Option to restart the game after it concludes.
* Clear and well-commented Dart code for better understanding.

## Code Structure

The code is contained within a single file, `main.dart`, and includes the following main components:

* **`main()`:** The entry point of the application, which calls the `startGame()` function.
* **`startGame()`:** Initializes the game variables (winner status, turn, move count, board values) and starts a new game by displaying the initial board and prompting the first player for input.
* **`checkCombination(String combination, String checkFor)`:** A function that checks if a specific combination of board cells (represented by indices) all contain the same player's marker ('X' or '0').
* **`checkWinner(String player)`:** Iterates through predefined winning combinations to check if the given player has won the game. If a winner is found, it prints a winning message and sets the `winner` flag to `true`.
* **`getNextCharacter()`:** Handles the game loop. It prompts the current player for their move, validates the input, updates the board, checks for a winner or a draw, and then calls itself for the next turn if the game is not over.
* **`askForRestart()`:** Prompts the players if they want to play another game after the current one ends.
* **`clearScreen()`:** Clears the console screen for a cleaner game experience (supports both Windows and other platforms).
* **`generateBoard()`:** Displays the current state of the Tic-Tac-Toe board in the console.

## Winning Combinations

The `combinations` list in the code defines all the possible winning lines on the board using the indices of the `values` list:

```dart
List<String> combinations = ['012', '048', '036', '147', '246', '258'];
