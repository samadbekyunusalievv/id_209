List<List<List<int>>> correctSteps = [
  [
    //1
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5]
  ],
  [
    //2
    [1, 0],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5]
  ],
  [
    //3
    [3, 0],
    [3, 1],
    [2, 1],
    [1, 1],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
  ],
  [
    //4
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 2],
    [1, 1],
    [1, 0],
  ],
  [
    //5
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 2],
    [1, 1],
    [1, 0],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 3],
    [3, 2],
    [3, 1],
    [3, 0],
  ],
  [
    //6
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [3, 2],
    [3, 1],
    [3, 0],
    [2, 0],
    [1, 0],
  ],
  [
    //7
    [4, 0],
    [4, 1],
    [3, 1],
    [2, 1],
    [2, 2],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
  ],
  [
    //8
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [3, 1],
    [2, 1],
    [2, 2],
    [3, 2],
    [3, 3],
    [2, 3],
    [1, 3],
    [0, 3],
  ],
  [
    //9
    [0, 0],
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
    [2, 4],
    [1, 4],
    [0, 4],
    [0, 5],
  ],
  [
    //10
    [0, 0],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [2, 3],
    [2, 2],
    [2, 1],
    [2, 0],
    [3, 0],
  ],
  [
    //11
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 2],
    [1, 3],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 5],
    [2, 5],
    [3, 5],
    [4, 5],
    [4, 4],
    [4, 3],
    [5, 3],
    [5, 2],
    [4, 2],
    [4, 1],
    [4, 0],
    [3, 0],
    [2, 0],
    [1, 0],
  ],
  [
    //12
    [1, 0],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 4],
    [1, 5],
    [2, 5],
    [3, 5],
    [4, 5],
    [5, 5],
    [5, 4],
    [5, 3],
    [4, 3],
    [3, 3],
    [3, 2],
    [4, 2],
    [5, 2],
    [5, 1],
    [5, 0],
    [4, 0],
    [3, 0],
    [2, 0],
  ],
  [
    //13
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [1, 1],
    [2, 1],
    [2, 2],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
  ],
  [
    //14
    [4, 0],
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [4, 5],
    [3, 5],
    [2, 5],
    [1, 5],
  ],
  [
    //15
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 2],
    [2, 2],
    [2, 1],
    [2, 0],
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [3, 4],
    [2, 4],
    [1, 4],
    [1, 5],
  ],
  [
    //16
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
    [4, 1],
    [5, 1],
    [6, 1],
    [7, 1],
    [7, 2],
    [6, 2],
    [5, 2],
    [4, 2],
    [4, 3],
    [4, 4],
    [3, 4],
    [2, 4],
    [1, 4],
    [1, 5],
  ],
  [
    // 17
    [0, 3],
    [1, 3],
    [1, 4],
    [2, 4],
    [2, 3],
    [3, 3],
    [3, 4],
    [4, 4],
    [4, 3],
    [4, 2],
    [5, 2],
    [5, 1],
    [4, 1],
    [4, 0],
  ],
  [
    //18
    [1, 0],
    [1, 1],
    [0, 1],
    [0, 2],
    [1, 2],
    [2, 2],
    [2, 3],
    [1, 3],
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [3, 5],
    [2, 5],
  ],
  [
    //19
    [0, 4],
    [0, 3],
    [0, 2],
    [0, 1],
    [0, 0],
    [1, 0],
    [1, 1],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [1, 5],
  ],
  [
    //20
    [0, 1],
    [0, 0],
    [1, 0],
    [1, 1],
    [2, 1],
    [3, 1],
    [3, 2],
    [3, 3],
    [4, 3],
    [5, 3],
    [5, 2],
    [5, 1],
    [5, 0],
  ],
  [
    //21
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [3, 1],
    [3, 2],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [3, 5],
    [4, 5],
    [5, 5],
  ],
  [
    //22
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [3, 1],
    [3, 2],
    [2, 2],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [3, 5],
    [2, 5],
  ],
  [
    //23
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 2],
    [1, 1],
    [1, 0],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 3],
    [3, 2],
    [3, 1],
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [5, 3],
    [5, 2],
    [5, 1],
    [5, 0],
  ],
  [
    // 24
    [3, 0],
    [3, 1],
    [2, 1],
    [2, 2],
    [3, 2],
    [3, 3],
    [2, 3],
    [1, 3],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [1, 5],
  ],
  [
    //25
    [0, 4],
    [1, 4],
    [1, 5],
    [2, 5],
    [2, 4],
    [3, 4],
    [3, 5],
    [4, 5],
    [4, 4],
    [4, 3],
    [5, 3],
    [5, 2],
    [4, 2],
    [4, 1],
    [3, 1],
    [2, 1],
    [1, 1],
    [0, 1],
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
  ],
  [
    // 26
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1],
    [5, 1],
    [6, 1],
    [6, 2],
    [6, 3],
    [6, 4],
    [6, 5],
    [5, 5],
    [5, 4],
    [4, 4],
    [4, 5],
    [3, 5],
    [3, 4],
    [3, 3],
  ],
  [
    // 27
    [0, 0],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [2, 3],
    [2, 2],
    [3, 2],
    [3, 3],
    [4, 3],
    [4, 2],
    [5, 3],
    [6, 3],
    [6, 2],
    [6, 1],
    [6, 0],
    [5, 0],
    [4, 0],
    [3, 0],
    [2, 0],
  ],
  [
    //28
    [0, 3],
    [0, 2],
    [0, 1],
    [1, 1],
    [1, 2],
    [2, 2],
    [2, 3],
    [3, 3],
    [4, 3],
    [5, 3],
    [5, 2],
    [5, 1],
    [5, 0],
    [4, 0],
    [3, 0],
    [3, 1],
    [2, 1],
    [2, 0],
  ],
  [
    // 29
    [0, 0],
    [1, 0],
    [1, 1],
    [2, 1],
    [3, 1],
    [3, 2],
    [2, 2],
    [2, 3],
    [3, 3],
    [3, 4],
    [2, 4],
    [2, 5],
    [3, 5],
    [4, 5],
    [5, 5],
  ],
  [
    //30
    [1, 5],
    [0, 5],
    [0, 4],
    [0, 3],
    [0, 2],
    [1, 2],
    [1, 1],
    [0, 1],
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [5, 2],
    [5, 3],
    [5, 4],
    [4, 4],
    [3, 4],
    [3, 5],
  ],
  [
    //31
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [5, 2],
    [5, 3],
    [5, 4],
    [4, 4],
    [3, 4],
    [3, 3],
    [2, 3],
    [1, 3],
    [1, 2],
    [1, 1],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 5],
  ],
  [
    //32
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [1, 1],
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 3],
  ],
  [
    //33
    [3, 1],
    [2, 1],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [4, 3],
    [5, 3],
    [6, 3],
    [6, 2],
  ],
  [
    //34
    [3, 2],
    [3, 1],
    [3, 0],
    [2, 0],
    [1, 0],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [5, 4],
    [5, 5],
  ],
  [
    //35
    [0, 1],
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [3, 1],
    [4, 1],
    [4, 2],
    [3, 2],
    [3, 3],
    [3, 4],
    [4, 4],
    [5, 4],
    [5, 5],
    [4, 5],
  ],
  [
    //36
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 2],
    [2, 2],
    [2, 3],
    [3, 3],
    [3, 2],
    [3, 1],
    [4, 1],
    [4, 2],
    [4, 3],
    [5, 3],
    [5, 2],
    [5, 1],
    [5, 0],
    [4, 0],
  ],
  [
    //37
    [0, 0],
    [1, 0],
    [2, 0],
    [3, 0],
    [3, 1],
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 3],
    [3, 4],
    [4, 4],
    [5, 4],
    [5, 5],
    [4, 5],
  ],
  [
    //38
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 5],
    [2, 5],
    [2, 4],
    [2, 3],
    [2, 2],
    [2, 1],
    [2, 0],
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [3, 4],
  ],
  [
    //39
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [3, 2],
    [3, 3],
    [4, 3],
    [5, 3],
    [6, 3],
    [7, 3],
    [7, 2],
    [7, 1],
    [7, 0],
    [6, 0],
    [5, 0],
    [5, 1],
    [5, 2],
  ],
  [
    //40
    [3, 0],
    [3, 1],
    [2, 1],
    [1, 1],
    [0, 1],
    [0, 2],
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2],
    [4, 3],
    [3, 3],
    [2, 3],
    [2, 4],
    [3, 4],
    [3, 5],
  ],
  [
    //41
    [0, 1],
    [1, 1],
    [1, 0],
    [2, 0],
    [2, 1],
    [2, 2],
    [1, 2],
    [1, 3],
    [1, 4],
    [1, 5],
    [2, 5],
    [2, 4],
    [3, 4],
  ],
  [
    //42
    [4, 0],
    [3, 0],
    [3, 1],
    [3, 2],
    [2, 2],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 4],
    [0, 4],
    [0, 5],
    [1, 5],
    [2, 5],
    [2, 4],
    [3, 4],
  ],
  [
    //43
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [1, 3],
    [1, 2],
    [1, 1],
    [2, 1],
    [2, 0],
    [3, 0],
    [3, 1],
    [3, 2],
    [4, 2],
    [5, 2],
    [5, 3],
    [4, 3],
    [3, 3],
    [3, 4],
    [3, 5],
    [2, 5],
    [2, 4],
    [2, 3],
    [2, 2],
  ],
  [
    //44
    [4, 0],
    [3, 0],
    [3, 1],
    [2, 1],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 4],
    [0, 4],
    [0, 5],
    [1, 5],
    [2, 5],
    [3, 5],
  ],
  [
    //45
    [0, 2],
    [0, 1],
    [1, 1],
    [1, 0],
    [2, 0],
    [2, 1],
    [3, 1],
    [3, 0],
    [4, 0],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [4, 5],
    [5, 5],
    [6, 5],
    [6, 4],
    [5, 4],
    [5, 3],
    [5, 2],
  ],
  [
    //46
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1],
    [4, 0],
    [5, 0],
    [5, 1],
    [6, 1],
    [6, 0],
    [7, 0],
    [7, 1],
    [7, 2],
    [7, 3],
    [7, 4],
    [7, 5],
    [6, 5],
    [5, 5],
    [4, 5],
    [4, 4],
    [4, 3],
    [3, 3],
  ],
  [
    //47
    [4, 1],
    [4, 0],
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
    [5, 3],
    [5, 2],
    [5, 1],
    [5, 0],
  ],
  [
    //48
    [3, 2],
    [3, 1],
    [2, 1],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
  ],
  [
    //49
    [3, 0],
    [2, 0],
    [2, 1],
    [1, 1],
    [0, 1],
    [0, 2],
    [1, 2],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [1, 5],
    [1, 4],
  ],
  [
    //50
    [0, 5],
    [1, 5],
    [2, 5],
    [3, 5],
    [3, 4],
    [4, 4],
    [5, 4],
    [5, 3],
    [5, 2],
    [4, 2],
    [4, 1],
    [3, 1],
    [2, 1],
    [2, 0],
    [1, 0],
    [1, 1],
    [1, 2],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
  ],
  [
    //51
    [4, 5],
    [4, 4],
    [3, 4],
    [2, 4],
    [1, 4],
    [0, 4],
    [0, 3],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
    [4, 2],
    [3, 2],
    [3, 1],
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
  ],
  [
    //52
    [4, 1],
    [3, 1],
    [2, 1],
    [1, 1],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2],
    [4, 3],
    [4, 4],
    [3, 4],
    [2, 4],
    [1, 4],
  ],
  [
    //53
    [0, 1],
    [1, 1],
    [1, 2],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [3, 5],
    [3, 4],
    [3, 3],
    [4, 3],
    [5, 3],
    [6, 3],
    [6, 2],
    [6, 1],
    [6, 0],
  ],
  [
    //54
    [0, 1],
    [0, 0],
    [1, 0],
    [2, 0],
    [2, 1],
    [2, 2],
    [3, 2],
    [3, 1],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [4, 5],
    [3, 5],
    [3, 4],
    [2, 4],
  ],
  [
    //55
    [0, 3],
    [0, 4],
    [1, 4],
    [2, 4],
    [3, 4],
    [4, 4],
    [5, 4],
    [5, 3],
    [4, 3],
    [3, 3],
    [3, 2],
    [3, 1],
    [3, 0],
    [4, 0],
    [4, 1],
    [5, 1],
    [6, 1],
    [6, 0],
  ],
  [
    //56
    [5, 0],
    [5, 1],
    [6, 1],
    [6, 2],
    [5, 2],
    [4, 2],
    [4, 1],
    [3, 1],
    [3, 2],
    [3, 3],
    [4, 3],
    [4, 4],
    [3, 4],
    [2, 4],
    [2, 3],
    [2, 2],
    [1, 2],
    [0, 2],
    [0, 3],
    [1, 3],
    [1, 4],
    [0, 4],
    [0, 5],
  ],
  [
    //57
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 2],
    [1, 3],
    [2, 3],
    [3, 3],
    [4, 3],
  ],
  [
    //58
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 3],
    [4, 3],
    [4, 2],
    [4, 1],
    [4, 0],
    [3, 0],
    [2, 0],
    [1, 0],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [1, 4],
    [1, 5],
    [2, 5],
    [3, 5],
    [4, 5],
    [4, 4],
  ],
  [
    //59
    [0, 1],
    [1, 1],
    [2, 1],
    [3, 1],
    [3, 2],
    [3, 3],
    [4, 3],
    [5, 3],
    [6, 3],
    [7, 3],
    [7, 2],
    [7, 1],
    [6, 1],
    [5, 1],
    [4, 1],
    [4, 0],
  ],
  [
    //60
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 5],
    [2, 5],
    [3, 5],
    [3, 4],
    [2, 4],
    [2, 3],
    [3, 3],
    [4, 3],
    [4, 2],
    [3, 2],
    [2, 2],
    [2, 1],
    [3, 1],
    [3, 0],
  ],
];
