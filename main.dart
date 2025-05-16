import 'dart:io';
import 'dart:core';

bool winner = false;
bool isXturn = true;
int moveCount = 0;
List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combinations = [
  '012', // First row
  '345', // Second row
  '678', // Third row
  '036', // First column
  '147', // Second column
  '258', // Third column
  '048', // Diagonal 1
  '246'  // Diagonal 2
];

void main() {
  print('Welcome to Tic Tac Toe!');
  startGame();
}

/// Initialize game state and start new game
void startGame() {
  winner = false;
  isXturn = true;
  moveCount = 0;
  values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  clearScreen();
  generateBoard();
  getNextMove();
}

/// Check if current combination matches player's marks
bool checkCombination(String combination, String player) {
  List<int> indexes = combination.split('').map((s) => int.parse(s)).toList();
  return indexes.every((index) => values[index] == player);
}

/// Verify if current player has winning combination
void checkWinner(String player) {
  for (String combo in combinations) {
    if (checkCombination(combo, player)) {
      winner = true;
      print('$player WINS!');
      return;
    }
  }
}

/// Handle player input and game logic
void getNextMove() {
  if (winner) {
    askForRestart();
    return;
  }

  if (moveCount == 9) {
    print('DRAW!');
    askForRestart();
    return;
  }

  final currentPlayer = isXturn ? 'X' : 'O';
  print('Player $currentPlayer\'s turn (Enter 1-9):');
  
  try {
    String? input = stdin.readLineSync();
    int? number = int.tryParse(input ?? '');
    
    if (number == null || number < 1 || number > 9) {
      throw FormatException('Invalid input');
    }

    int index = number - 1;
    
    if (values[index] == 'X' || values[index] == 'O') {
      print('Cell already occupied!');
      getNextMove();
      return;
    }

    // Update game state
    values[index] = currentPlayer;
    moveCount++;
    isXturn = !isXturn;
    
    clearScreen();
    generateBoard();
    
    checkWinner(currentPlayer);
    
    if (!winner && moveCount < 9) {
      getNextMove();
    } else if (moveCount == 9) {
      print('DRAW!');
      askForRestart();
    } else {
      askForRestart();
    }
    
  } catch (e) {
    print('Invalid input. Please enter number 1-9');
    getNextMove();
  }
}

/// Display current game board
void generateBoard() {
  print('\n ${values[0]} | ${values[1]} | ${values[2]} ');
  print('-----------');
  print(' ${values[3]} | ${values[4]} | ${values[5]} ');
  print('-----------');
  print(' ${values[6]} | ${values[7]} | ${values[8]} \n');
}

/// Clear console screen
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
}

/// Handle game restart logic
void askForRestart() {
  print('Play again? (yes/no)');
  String? choice = stdin.readLineSync()?.toLowerCase();
  
  if (choice == 'yes') {
    startGame();
  } else {
    print('Thanks for playing!');
    exit(0);
  }
}
