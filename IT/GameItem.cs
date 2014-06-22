using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT
{
    [Serializable]
    public class GameItem
    {
        public int index {get; set;}
        public int value { get; set; }
        public GameItem(int i, int v)
        {
            index = i;
            value = v;
        }
    }
}