import 'dart:io';
import 'dart:core';

bool winner = false;
bool isXturn = true;
int moveCount = 0;
List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combinations = ['012', '048', '036', '147', '246', '258'];

// Run | Debug
void main() {
  startGame();
}

void startGame() {
  winner = false;
  isXturn = true;
  moveCount = 0;
  values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  generateBoard();
  getNextCharacter();
}

////////////////////////////////////////////////////////////////////////////////
//check if a combination is true or false for a player (X or 0)
bool checkCombination(String combination, String checkFor) {
  //split the numbers in a list of integers
  List<int> numbers = combination.split('').map((item) => int.parse(item)).toList();
  bool match = false;
  for (final item in numbers) {
    if (values[item] == checkFor) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

////////////////////////////////////////////////////////////////////////////////
void checkWinner(String player) {
  for (final item in combinations) {
    bool combinationValidity = checkCombination(item, player);
    if (combinationValidity == true) {
      print('$player WON!');
      winner = true;
      break;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
//get input, check winners
void getNextCharacter() {
  if (winner) {
    print('Game Over!');
    askForRestart();
    return;
  }

  print('Choose Number for ${isXturn == true ? "X" : "0"} :');
  String? input = stdin.readLineSync();

  if (input != null) {
    try {
      int number = int.parse(input);
      if (number >= 1 && number <= 9) {
        if (values[number - 1] != 'X' && values[number - 1] != 'O') {
          values[number - 1] = isXturn ? 'X' : '0';
          isXturn = !isXturn;
          moveCount++;
          clearScreen();
          generateBoard();

          checkWinner('X');
          checkWinner('0');

          if (!winner && moveCount < 9) {
            getNextCharacter();
          } else if (!winner && moveCount == 9) {
            print('DRAW!');
            askForRestart();
          } else if (winner) {
            askForRestart();
          }
        } else {
          print('That cell is already occupied. Please choose an empty cell.');
          getNextCharacter(); // Ask for input again
        }
      } else {
        print('Invalid input. Please enter a number between 1 and 9.');
        getNextCharacter(); // Ask for input again
      }
    } catch (e) {
      print('Invalid input. Please enter a number.');
      getNextCharacter(); // Ask for input again
    }
  } else {
    print('No input received. Please try again.');
    getNextCharacter(); // Ask for input again
  }
}

////////////////////////////////////////////////////////////////////////////////
void askForRestart() {
  print('Do you want to play again? (yes/no)');
  String? playAgain = stdin.readLineSync()?.toLowerCase();
  if (playAgain == 'yes') {
    startGame();
  } else {
    print('Thank you for playing!');
  }
}

////////////////////////////////////////////////////////////////////////////////
//clear console screen
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

////////////////////////////////////////////////////////////////////////////////
//show current state of board
void generateBoard() {
  print(' | | ');
  print('${values[0]}|${values[1]}|${values[2]}');
  print('-----');
  print('${values[3]}|${values[4]}|${values[5]}');
  print('-----');
  print('${values[6]}|${values[7]}|${values[8]}');
  print(' | | ');
}
