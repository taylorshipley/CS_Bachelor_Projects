function myfunction()
{
   var looping = 0;
   var numLength = document.getElementById('userNum').value;
   while (looping === 0)
   {
      if (numLength > 0 && numLength < 9)
      {
         looping = 1;
      }
      else
      {
         window.alert("Invalid entry, try again.");
         looping = 2;
         document.getElementById("results").innerHTML = "";
      }
   }
   if (looping != 2)
   {
      var myArray = [];
      var i;
      for (i = 0; i < numLength; i++)
      {
         myArray[i] = Math.floor(Math.random() * 100) + 1;
      }
      var output = "";
      for (i = 0; i < numLength; i++)
      {
         output += myArray[i];
         if (i < numLength - 1)
         {
            output += "-";
         }
      }
      document.getElementById("results").innerHTML = output;
   }
}
