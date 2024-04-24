var name1= "Player1";
var name2 = "Player2";
var playerScore = 0;
var player2Score = 0;
var player = "O";
var player2 = "X";
var whoseTurn = 0;
function updateToken()
{
	if (document.getElementById("TokenSelector_X").checked)
		{
			player = "X";
			player2 = "O";
		}
	else
		{
			player = "O";
			player2 = "X";
		}
}

let board_full = false;
let play_board = ["", "", "", "", "", "", "", "", ""];

const board_container = document.querySelector(".play-area");

const winner_statement = document.getElementById("winner");

check_board_complete = () =>
{
  let flag = true;
  play_board.forEach(element => 
  {
    if (element != player && element != player2) 
	{
      flag = false;
    }
  });
  board_full = flag;
};


const check_line = (a, b, c) => 
{
  return (
    play_board[a] == play_board[b] &&
    play_board[b] == play_board[c] &&
    (play_board[a] == player || play_board[a] == player2)
  );
};

const check_match = () => 
{
  for (i = 0; i < 9; i += 3) 
  {
    if (check_line(i, i + 1, i + 2))
	{
      document.querySelector(`#block_${i}`).classList.add("win");
      document.querySelector(`#block_${i + 1}`).classList.add("win");
      document.querySelector(`#block_${i + 2}`).classList.add("win");
      return play_board[i];
    }
  }
  for (i = 0; i < 3; i++)
  {
    if (check_line(i, i + 3, i + 6))
	{
      document.querySelector(`#block_${i}`).classList.add("win");
      document.querySelector(`#block_${i + 3}`).classList.add("win");
      document.querySelector(`#block_${i + 6}`).classList.add("win");
      return play_board[i];
    }
  }
  if (check_line(0, 4, 8))
  {
    document.querySelector("#block_0").classList.add("win");
    document.querySelector("#block_4").classList.add("win");
    document.querySelector("#block_8").classList.add("win");
    return play_board[0];
  }
  if (check_line(2, 4, 6))
  {
    document.querySelector("#block_2").classList.add("win");
    document.querySelector("#block_4").classList.add("win");
    document.querySelector("#block_6").classList.add("win");
    return play_board[2];
  }
  return "";
};

const check_for_winner = () => 
{
  let res = check_match()
  if (res == player)
  {
	playerScore += 1;
	P1Wins.innerText = playerScore;
    winner.innerText = "Winner is " + name1 + "!!";
    winner.classList.add("playerWin");
    board_full = true
  } 
  else if (res == player2) 
  {
	player2Score += 1;
	P2Wins.innerText = player2Score;
    winner.innerText = "Winner is " + name2 + "!!";
    winner.classList.add("player2Win");
    board_full = true
  }
  else if (board_full)
  {
    winner.innerText = "Draw!";
    winner.classList.add("draw");
  }
};


const render_board = () => 
{
  board_container.innerHTML = ""
  play_board.forEach((e, i) => 
  {
    board_container.innerHTML += `<div id="block_${i}" class="block" onclick="addPlayerMove(${i})">${play_board[i]}</div>`
    if (e == player)
	{
      document.querySelector(`#block_${i}`).classList.add("occupied");
    }
  });
};

const game_loop = () => 
{
  render_board();
  check_board_complete();
  check_for_winner();
}

const addPlayerMove = e => 
{
  if (!board_full && play_board[e] == "") 
  {
	  var token;
	  if (whoseTurn == 0)
		  {
			  token = player;
			  whoseTurn = 1;
		  }
	  else if (whoseTurn == 1)
		  {
			  token = player2;
			  whoseTurn = 0;
		  }
    play_board[e] = token;
    game_loop();
  }
};

const reset_board = () => 
{
  whoseTurn = 0;
  play_board = ["", "", "", "", "", "", "", "", ""];
  board_full = false;
  winner.classList.remove("playerWin");
  winner.classList.remove("player2Win");
  winner.classList.remove("draw");
  winner.innerText = "";
  render_board();
};

render_board();

function clearScore()
{
	playerScore = 0;
	player2Score = 0;
}
function updateName()
{
	name1 = document.getElementById("name1").value;
	name2 = document.getElementById("name2").value;
	alert("Game settings have been updated.");
}