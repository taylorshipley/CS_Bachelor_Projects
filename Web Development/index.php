<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Random Page</title>
    </head>
    <body>
        <?php
        $score = 0;
        print("<table><tr><th>Player</th><th>Computer</th><th>Rounds</th></tr>\n");
        //here write a loop that will run 10 times and compare the scores, increment the score if greater, decrementing if less and leaving it if equal
        //this should print each round out in the table.
        for ($round = 0; $round < 10; $round++)
        {
            $playerscore = rand(1,100); 
            $computerscore = rand(1,100);
            if ($playerscore > $computerscore)
            {
                print("<td> Player won this round </td></tr>\n");
            }
            elseif ($playerscore < $computerscore)
            {
                print("<td> Computer won this round </td></tr>\n");
            }
            else
            {
                print("<td> It's a tie this round </td></tr>\n");
            }
        }

        print("<tr><td colspan=2>$score</td><td>Player Score</td></tr><table>\n");
        ($score > 0)?print("Good Job"):Print("Sorry you lost");
        print("\n");
        //Year of the---

        $year = date("Y");
        print("It is the year of the:<br>");
        switch($year%12)
        {
            case 0: 
                Print("Monkey");
                Break;
            case 1: 
                Print("Roster");
                Break;
            case 2: 
                Print("Dog");
                Break;
            case 3: 
                Print("Boar");
                Break;
            case 4: 
                Print("Rat");
                Break;
            case 5: 
                Print("Ox");
                Break;
            case 6: 
                Print("Tiger");
                Break;
            case 7: 
                Print("Rabbit");
                Break;
            case 8: 
                Print("Dragon");
                Break;
            case 9: 
                Print("Snake");
                Break;
            case 10: 
                Print("Horse");
                Break;
            case 11: 
                Print("Lamb");
                Break;
            default: 
                Print("Error");
                Break;
            }
        //Here you will write out a switch that will print out the year using the modulo(% 12)
        //Monkey, roster, dog, boar, rat, ox, tiger, rabbit, dragon, snake, horse, and lamb is the order, do not forget a default case
        ?>
    </body>
</html>
