using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using IT;

namespace Sudoku
{
    [Serializable]
    public class Grid
    {
        public Sudoku game;
        public Stack<GameItem> undoStack;
        public Stack<GameItem> redoStack;
        public List<int> values;
        public List<int> errorList;
        public List<int> firstGenerated;
        public int lastHint;
        public int hintTime = -1;
        public int numberOfHints = 3;
        public int time { get; set; }

        public int gameDiff;

        public Grid(int gameDiff)
        {
            game = new Sudoku();
            this.gameDiff = gameDiff;
           
            firstGenerated = new List<int>();
            values = new List<int>();
            errorList = new List<int>();

            for (int i = 0; i < 81; i++)
                values.Add(0);

            if (gameDiff == 3)
            {
                game.GenerateGame(GameLevel.TEST);
            }
            if (gameDiff == 0)
            {
                game.GenerateGame(GameLevel.SIMPLE);
            }
            if (gameDiff == 1)
            {
                game.GenerateGame(GameLevel.MEDIUM);
            }
            if (gameDiff == 2)
            {
                game.GenerateGame(GameLevel.COMPLEX);
            }
            undoStack = new Stack<GameItem>();
            redoStack = new Stack<GameItem>();
        }

        public void addToStack(int index, int value)
        {
            undoStack.Push(new GameItem(index, value));
            redoStack.Clear();
        }
        public GameItem undo()
        {
            if (undoStack.Count == 0) return null;

            GameItem item = undoStack.Pop();
            redoStack.Push(item);
            return item;
        }
        public GameItem redo()
        {
            if (redoStack.Count == 0) return null;
            GameItem item = redoStack.Pop();
            undoStack.Push(item);
            return item;
        }
    }
}
